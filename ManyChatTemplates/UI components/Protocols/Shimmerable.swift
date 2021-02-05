//
//  Shimmerable.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 05.02.2021.
//

import UIKit

protocol Shimmerable {
	func getSubViewsForAnimate() -> [UIView]
	func startAnimation()
	func stopAnimation()
	func setupCorners(for view: UIView, radius: CGFloat)
}


extension Shimmerable where Self: UIView {
	func startAnimation() {
		for animateView in getSubViewsForAnimate() {
			animateView.backgroundColor = .gray
			animateView.layer.removeAllAnimations()
			animateView.clipsToBounds = true
			let oldGradientLayer = animateView.layer.sublayers?.compactMap({ $0 as? CAGradientLayer }).first
			let gradientLayer = oldGradientLayer ?? CAGradientLayer()

			gradientLayer.colors = [UIColor.gray.cgColor,
									UIColor.red.cgColor,
									UIColor.gray.cgColor]
			gradientLayer.frame = CGRect(
				x: -animateView.bounds.size.width,
				y: 0,
				width: 3 * animateView.bounds.size.width,
				height: animateView.bounds.size.height)
			gradientLayer.startPoint = CGPoint(x: 0, y: 0)
			gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)

			gradientLayer.locations = [0.3, 0.5, 1.0]
			animateView.layer.addSublayer(gradientLayer)

			let animation = CABasicAnimation(keyPath: "locations")
			animation.duration = 1
			animation.fromValue = [0.15, 0.2, 0.25]
			animation.toValue = [0.75, 0.9, 1.0]
			animation.isRemovedOnCompletion = false
			animation.fillMode = .forwards
			animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)

			let group = CAAnimationGroup()
			group.animations = [animation]
			group.duration = 5
			group.repeatCount = .infinity

			gradientLayer.add(group, forKey: "shimmer")
		}
	}

	func stopAnimation() {
		for animateView in getSubViewsForAnimate() {
			animateView.backgroundColor = .clear
			animateView.layer.removeAllAnimations()
			animateView.layer.mask = nil
		}
	}

	func setupCorners(for view: UIView, radius: CGFloat) {
		view.layer.cornerRadius = radius
		view.clipsToBounds = true
	}
}
