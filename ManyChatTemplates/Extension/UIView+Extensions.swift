//
//  UIView+Extensions.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 29.01.2021.
//

import UIKit

extension UIView {
	convenience init(backgroundColor: UIColor) {
		self.init(frame: .zero)

		self.backgroundColor = backgroundColor
	}

	convenience init(cornerRadius: CGFloat) {
		self.init(frame: .zero)

		layer.cornerRadius = cornerRadius
		clipsToBounds = true
	}
}
