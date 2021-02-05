//
//  ProView.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 05.02.2021.
//

import UIKit

final class ProView: UIView {
	private let _titleLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.textColor = .white
		label.text = "PRO"
		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		addSubview(_titleLabel, constraints: [
			equal(\.centerXAnchor),
			equal(\.centerYAnchor),
			equal(\.leadingAnchor, constant: 16),
			equal(\.trailingAnchor, constant: -16),
		])

		backgroundColor = .blue

		layer.borderColor = UIColor.white.cgColor
		layer.borderWidth = 1.0
		layer.cornerRadius = 2.0
		layer.masksToBounds = true
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override var intrinsicContentSize: CGSize {
		return .init(width: .greatestFiniteMagnitude, height: 24.0)
	}
}
