//
//  UIImageView+Extensions.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 05.02.2021.
//

import UIKit

extension UIImageView {
	convenience init(contentMode: ContentMode, clipsToBounds: Bool = true) {
		self.init(frame: .zero)

		self.contentMode = contentMode
		self.clipsToBounds = clipsToBounds
	}
}
