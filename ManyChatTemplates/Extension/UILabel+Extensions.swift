//
//  UILabel+Extensions.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 29.01.2021.
//

import UIKit

extension UILabel {
	convenience init(numberOfLines: Int) {
		self.init(frame: .zero)

		self.numberOfLines = numberOfLines
	}
}
