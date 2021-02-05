//
//  TemplatesViewController.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 29.01.2021.
//

import UIKit

final class TempalteViewController: UIViewController {
	private let _tableView: UITableView = {
		let tableView = UITableView()
		tableView.register(ShimmerCell.self, forCellReuseIdentifier: "ShimmerCell")
		tableView.register(TemplateCell.self, forCellReuseIdentifier: "TemplateCell")
		tableView.separatorInset.left = 0
		tableView.estimatedRowHeight = 250
		tableView.rowHeight = UITableView.automaticDimension
		return tableView
	}()

	private var _state: State = .initial {
		didSet {
			_tableView.reloadData()
		}
	}

	override func loadView() {
		let view = UIView()
		view.backgroundColor = .white
		self.view = view
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		_setup(navigationController: navigationController)
		_setup(navigationItem: navigationItem)

		view.addSubview(_tableView, constraints: .allAnchors)

		_tableView.delegate = self
		_tableView.dataSource = self

		_state = .shimmers(totalCount: 5)
		DispatchQueue.global().asyncAfter(deadline: .now() + 5.0) {
			DispatchQueue.main.async {
//				[weak self] in - Нужен ли?
				self._state = .content(viewModels: ._mock)
			}
		}
	}

	private func _setup(navigationController: UINavigationController?) {
		guard let navigationController = navigationController else { return }
		navigationController.setNavigationBarHidden(false, animated: false)
		navigationController.navigationBar.barTintColor = .white
		navigationController.navigationBar.isTranslucent = false
		navigationController.navigationBar.setBackgroundImage(nil, for: .defaultPrompt)
		navigationController.navigationBar.shadowImage = nil
	}

	private func _setup(navigationItem: UINavigationItem) {
		let titleLabel = TitleSecondLabel()
		titleLabel.text = "Templates"
		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
	}
}

extension TempalteViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch _state {
		case .initial:
			return 0
		case .shimmers(let totalCount):
			return totalCount
		case .content(let viewModels):
			return viewModels.count
		}
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch _state {
		case .initial:
			fatalError()
		case .shimmers:
			let cell = tableView.dequeueReusableCell(withIdentifier: "ShimmerCell", for: indexPath)
			return cell
		case let .content(viewModels):
			guard let cell = tableView
					.dequeueReusableCell(withIdentifier: "TemplateCell", for: indexPath) as? TemplateCell else {
				fatalError()
			}
			guard let viewModel = viewModels[safe: indexPath.row] else {
				assertionFailure()
				return cell
			}
			cell.configure(viewModel: viewModel)
			return cell
		}
	}

	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		if let shimmerableCell = cell as? Shimmerable {
			shimmerableCell.startAnimation()
		}
	}
}

fileprivate extension TempalteViewController {
	enum State {
		case initial
		case shimmers(totalCount: Int)
		case content(viewModels: [TemplateCell.ViewModel])
	}
}

fileprivate extension Array where Element == TemplateCell.ViewModel {
	static let _mock: Self = [
		.init(
			title: "Collect Customer Feedback & Reviews",
			description: "Ask your customers to rate your product or services, collect feedback, and generate reviews for your business",
			image: UIImage(named: "mock_template_1")!,
			isPro: false),
		.init(
			title: "RallySeller",
			description: "Show different text to different people based on what they're more likely to respond to using A.I.",
			image: UIImage(named: "mock_template_2")!,
			isPro: true),
		.init(
			title: "Dialogflow AI Starter Kit by Janis.ai",
			description: "Instantly understand the most common messages with AI from Google",
			image: UIImage(named: "mock_template_3")!,
			isPro: false),
		.init(
			title: "Collect Customer Feedback & Reviews",
			description: "Ask your customers to rate your product or services, collect feedback, and generate reviews for your business",
			image: UIImage(named: "mock_template_1")!,
			isPro: true),
	]
}
