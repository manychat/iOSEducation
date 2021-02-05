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

typealias Constraint = (_ child: UIView, _ parent: UIView) -> NSLayoutConstraint

extension UIView {
	func addSubview(_ child: UIView, constraints: [Constraint]) {
		addSubview(child)
		child.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate(constraints.map { $0(child, self) })
	}
	func add(_ constraints: [Constraint]) {
		translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate(constraints.map { $0(self, self) })
	}
}

extension UIStackView {
	func addArrangedSubview(_ child: UIView, constraints: [Constraint]) {
		addArrangedSubview(child)
		child.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate(constraints.map { $0(child, self) })
	}
}


extension NSLayoutConstraint {
	func with(priority: UILayoutPriority) -> NSLayoutConstraint {
		self.priority = priority
		return self
	}
}

/// ````
/// childView.{axis}Anchor.constraint(equalTo: parentView.{axis}Anchor, constant: constant)
/// ````
func equal<Axis, Anchor>(
	_ keyPath: KeyPath<UIView, Anchor>,
	_ to: KeyPath<UIView, Anchor>,
	constant: CGFloat = 0,
	priority: UILayoutPriority = .required)
-> Constraint where Anchor: NSLayoutAnchor<Axis> {
	return { child, parent in
		child[keyPath: keyPath].constraint(equalTo: parent[keyPath: to], constant: constant)
			.with(priority: priority)
	}
}

/// ````
/// childView.{axis}Anchor.constraint(equalTo: parentView.{axis}Anchor, constant: constant)
/// ````
func equal<Axis, Anchor>(
	_ keyPath: KeyPath<UIView, Anchor>,
	constant: CGFloat = 0,
	priority: UILayoutPriority = .required)
-> Constraint where Anchor: NSLayoutAnchor<Axis> {
	return equal(keyPath, keyPath, constant: constant, priority: priority)
}

/// ````
/// childView.{axis}Anchor.constraint(equalTo: toView.{axis}Anchor, constant: constant)
/// ````
func equal<Axis, Anchor>(
	_ keyPath: KeyPath<UIView, Anchor>,
	to view: UIView,
	_ to: KeyPath<UIView, Anchor>,
	constant: CGFloat = 0,
	priority: UILayoutPriority = .required)
-> Constraint where Anchor: NSLayoutAnchor<Axis> {
	return { child, _ in
		child[keyPath: keyPath].constraint(equalTo: view[keyPath: to], constant: constant)
			.with(priority: priority)
	}
}

/// ````
/// childView.{dimension}Anchor.constraint(equalToConstant: constant)
/// ````
func equal<Dimension>(
	_ keyPath: KeyPath<UIView, Dimension>,
	constant: CGFloat = 0,
	priority: UILayoutPriority = .required)
-> Constraint where Dimension: NSLayoutDimension {
	return { child, _ in
		child[keyPath: keyPath].constraint(equalToConstant: constant)
			.with(priority: priority)
	}
}

/// ````
/// childView.{axis}Anchor.constraint(greaterThanOrEqualTo: parentView.{axis}Anchor, constant: constant)
/// ````
func greaterThanOrEqual<Axis, Anchor>(
	_ keyPath: KeyPath<UIView, Anchor>,
	_ to: KeyPath<UIView, Anchor>,
	constant: CGFloat = 0,
	priority: UILayoutPriority = .required)
-> Constraint where Anchor: NSLayoutAnchor<Axis> {
	return { child, parent in
		child[keyPath: keyPath].constraint(greaterThanOrEqualTo: parent[keyPath: to], constant: constant)
			.with(priority: priority)
	}
}

/// ````
/// childView.{axis}Anchor.constraint(greaterThanOrEqualTo: parentView.{axis}Anchor, constant: constant)
/// ````
func greaterThanOrEqual<Axis, Anchor>(
	_ keyPath: KeyPath<UIView, Anchor>,
	constant: CGFloat = 0,
	priority: UILayoutPriority = .required)
-> Constraint where Anchor: NSLayoutAnchor<Axis> {
	return greaterThanOrEqual(keyPath, keyPath, constant: constant, priority: priority)
}

/// ````
/// childView.{axis}Anchor.constraint(greaterThanOrEqualTo: toView.{axis}Anchor, constant: constant)
/// ````
func greaterThanOrEqual<Axis, Anchor>(
	_ keyPath: KeyPath<UIView, Anchor>,
	to view: UIView,
	_ to: KeyPath<UIView, Anchor>,
	constant: CGFloat = 0,
	priority: UILayoutPriority = .required)
-> Constraint where Anchor: NSLayoutAnchor<Axis> {
	return { child, _ in
		child[keyPath: keyPath].constraint(greaterThanOrEqualTo: view[keyPath: to], constant: constant)
			.with(priority: priority)
	}
}


extension Collection {
	subscript(safe index: Index) -> Element? {
		return indices.contains(index) ? self[index] : nil
	}
}

extension Array where Element == Constraint {
	static func allAnchors(top: CGFloat = 0,
						   bottom: CGFloat = 0,
						   leading: CGFloat = 0,
						   trailing: CGFloat = 0) -> [Constraint] {
		return [
			equal(\.topAnchor, constant: top),
			equal(\.bottomAnchor, constant: bottom),
			equal(\.leadingAnchor, constant: leading),
			equal(\.trailingAnchor, constant: trailing)
		]
	}

	static func allAnchors(margin: CGFloat = 0) -> [Constraint] {
		return .allAnchors(top: margin, bottom: -margin, leading: margin, trailing: -margin)
	}

	static var allAnchors: [Constraint] {
		return .allAnchors(margin: 0)
	}
}
