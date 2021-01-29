//
//  UIButton+Extensions.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 29.01.2021.
//

import UIKit

extension UIButton {
	convenience init(cornerRadius: CGFloat) {
		self.init(frame: .zero)

		layer.cornerRadius = cornerRadius
		clipsToBounds = true
	}
}

extension UIButton {
	override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		isHighlighted = true
		super.touchesBegan(touches, with: event)
	}

	override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		isHighlighted = false
		super.touchesEnded(touches, with: event)
	}

	override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
		isHighlighted = false
		super.touchesCancelled(touches, with: event)
	}
}
