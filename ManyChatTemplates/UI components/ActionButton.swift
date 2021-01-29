//
//  ActionButton.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 29.01.2021.
//

import UIKit

final class ActionButton: UIButton {
	override init(frame: CGRect) {
		super.init(frame: frame)

		titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
		setTitleColor(.white, for: .normal)
//		backgroundColor = .red
		setBackgroundImage(.withColor(.init(style: .blueOne)), for: .normal)

		translatesAutoresizingMaskIntoConstraints = false
	}

	required init?(coder: NSCoder) {
		fatalError()
	}

	override var intrinsicContentSize: CGSize {
		return .init(width: .greatestFiniteMagnitude, height: 48.0)
	}
}
