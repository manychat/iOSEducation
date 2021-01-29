//
//  TemplatesViewController.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 29.01.2021.
//

import UIKit

final class TempalteViewController: UIViewController {
	private let _tableView = UITableView()

	override func loadView() {
		let view = UIView()
		view.backgroundColor = .white
		self.view = view
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		navigationController?.setNavigationBarHidden(false, animated: false)
		navigationController?.navigationBar.barTintColor = .white
		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar.setBackgroundImage(nil, for: .defaultPrompt)
		navigationController?.navigationBar.shadowImage = nil

		let titleLabel = TitleSecondLabel()
		titleLabel.text = "Templates"
		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)

		view.addSubview(_tableView)

		_tableView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			_tableView.topAnchor.constraint(equalTo: view.topAnchor),
			_tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			_tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			_tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])

		_tableView.delegate = self
		_tableView.dataSource = self
		_tableView.register(ShimmerCell.self, forCellReuseIdentifier: "ShimmerCell")

		_tableView.reloadData()

		DispatchQueue.global().asyncAfter(deadline: .now() + 5.0) {
			DispatchQueue.main.async {
				// Здесь ваш код перезагрузки таблицы с данными
			}
		}
	}
}

extension TempalteViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return 5
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ShimmerCell", for: indexPath)
		switch indexPath.section {
		case 0:
			cell.backgroundColor = .black
		case 1...2:
			cell.backgroundColor = .yellow
		default:
			break
		}
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}
