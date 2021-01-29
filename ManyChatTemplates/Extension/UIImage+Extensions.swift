//
//  UIImage+Extensions.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 29.01.2021.
//

import UIKit

extension UIImage {
	static func withColor(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
		let format = UIGraphicsImageRendererFormat()
		format.scale = 1
		let image =  UIGraphicsImageRenderer(size: size, format: format).image { rendererContext in
			color.setFill()
			rendererContext.fill(CGRect(origin: .zero, size: size))
		}
		return image
	}
}
