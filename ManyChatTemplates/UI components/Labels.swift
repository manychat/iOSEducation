//
//  TitleLabel.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 29.01.2021.
//

import UIKit

final class TitleSecondLabel: UILabel {
	override init(frame: CGRect) {
		super.init(frame: frame)

		font = UIFont.preferredFont(forTextStyle: .title1)
		textColor = UIColor(style: .primary)

		translatesAutoresizingMaskIntoConstraints = false
	}

	required init?(coder: NSCoder) {
		fatalError()
	}
}

final class BodyOneLabel: UILabel {
	override init(frame: CGRect) {
		super.init(frame: frame)

		font = UIFont.preferredFont(forTextStyle: .body)
		textColor = UIColor(style: .secondary)

		translatesAutoresizingMaskIntoConstraints = false
	}

	required init?(coder: NSCoder) {
		fatalError()
	}
}

final class BodySecondLabel: UILabel {
	override init(frame: CGRect) {
		super.init(frame: frame)

		font = UIFont.preferredFont(forTextStyle: .title3)
		textColor = UIColor(style: .secondary)

		translatesAutoresizingMaskIntoConstraints = false
	}

	required init?(coder: NSCoder) {
		fatalError()
	}
}
