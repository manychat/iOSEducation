//
//  UIColor+Extensions.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 29.01.2021.
//

import UIKit

extension UIColor {
	convenience init(style: Style) {
		switch style {
		case .primary:
			self.init(red: 0.137, green: 0.169, blue: 0.224, alpha: 1)
		case .secondary:
			self.init(red: 0.353, green: 0.404, blue: 0.49, alpha: 1)
		case .blueOne:
			self.init(red: 0, green: 0.497, blue: 0.96, alpha: 1)
		}
	}
}

extension UIColor {
	enum Style {
		case primary
		case secondary
		case blueOne
	}
}
