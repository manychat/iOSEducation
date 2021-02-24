//
//  ViewController.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 21.01.2021.
//

import UIKit

class ViewController: UIViewController {
	let titleLabel = TitleSecondLabel(numberOfLines: 0)
	let descriptionLabel = BodyOneLabel(numberOfLines: 0)
	let appIconView: UIImageView = {
		let imageView = UIImageView(image: (UIImage(named: "ic_manychat") ?? UIImage()))
		imageView.contentMode = .left
		return imageView
	}()

	private let _actionButton = ActionButton(cornerRadius: 12)
	private let _termOfServiceTextView = UITextView()

	override func loadView() {
		view = UIView(backgroundColor: .white)
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		navigationController?.setNavigationBarHidden(true, animated: false)

		_setup(titleLabel: titleLabel, descriptionLabel: descriptionLabel)
		_setup(termOfServiceTextView: _termOfServiceTextView)

		_actionButton.setTitle("Choose Template", for: .normal)

		// ARK - automatic refereance counter

		_actionButton.addAction(.init(handler: { [weak self] (action) in
			let templateViewController = TempalteViewController()
			self?.navigationController?.pushViewController(templateViewController, animated: true)
			UserDefaultService.hasSignIn = true
		}), for: .touchUpInside)
		// New style iOS 14+
//		_actionButton.addAction(.init(handler: { (action) in
//
//		}), for: .touchUpInside)
		// Old style
		_actionButton.addTarget(self, action: #selector(_didPressedActionButton(_:)), for: .touchUpInside)

		let bottomStackView = _createVerticalStackView(with: [_actionButton, _termOfServiceTextView], spacing: ._buttonToTextSpacing)
		view.addSubview(bottomStackView)

		let textStackView = _createVerticalStackView(with: [titleLabel, descriptionLabel], spacing: ._textSpacing)
		let centerStackView = _createVerticalStackView(with: [appIconView, textStackView], spacing: ._iconToTextSpacing)

		let topView = UIView()
		topView.translatesAutoresizingMaskIntoConstraints = false
		topView.addSubview(centerStackView)
		view.addSubview(topView)

		NSLayoutConstraint.activate([
			bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -._bottomStackViewOffset),
			bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ._leadingTralingOffset),
			bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -._leadingTralingOffset),
		])

		NSLayoutConstraint.activate([
			topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			topView.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor),
			topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ._leadingTralingOffset),
			topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -._leadingTralingOffset),
		])

		NSLayoutConstraint.activate([
			centerStackView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
			centerStackView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
			centerStackView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
			centerStackView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
		])
	}

	private func _setup(titleLabel: UILabel, descriptionLabel: UILabel) {
		titleLabel.text = "ManyChat Template Store"
		descriptionLabel.text = "Welcome to ManyChat Template store! Get your chatbot up and running instantly by choosing a template that fits your industry. See what’s inside by clicking “show more” and trying a live demo."
	}

	private func _setup(termOfServiceTextView: UITextView) {
		let textPart = "By choosing in here, you agree to our "
		let termOfService = "Terms & Privacy Policy"
		let attributedString = NSMutableAttributedString(string: "\(textPart)\(termOfService)")
		attributedString.addAttribute(
			.font,
			value: UIFont.preferredFont(forTextStyle: .body),
			range: .init(location: 0, length: attributedString.string.count))
		attributedString.addAttribute(
			.link,
			value: URL(string: "https://manychat.com/tos.html")!,
			range: .init(location: textPart.count, length: termOfService.count))
		attributedString.addAttribute(
			.foregroundColor,
			value: UIColor(style: .primary),
			range: .init(location: 0, length: textPart.count))

		_termOfServiceTextView.linkTextAttributes = [.foregroundColor: UIColor(style: .secondary)]


		_termOfServiceTextView.attributedText = attributedString
		_termOfServiceTextView.textAlignment = .center
		_termOfServiceTextView.isEditable = false
		_termOfServiceTextView.isScrollEnabled = false
	}

	@objc private func _didPressedActionButton(_ sender: UIButton) {

	}

	private func _createVerticalStackView(with arrangedSubviews: [UIView], spacing: CGFloat) -> UIStackView {
		let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
		stackView.distribution = .equalSpacing
		stackView.axis = .vertical
		stackView.spacing = spacing
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}
}

fileprivate extension CGFloat {
	static let _buttonToTextSpacing: Self = 16
	static let _textSpacing: Self = 12
	static let _iconToTextSpacing: Self = 16

	static let _bottomStackViewOffset: Self = 16
	static let _leadingTralingOffset: Self = 32
}
