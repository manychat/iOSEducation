//
//  ShimmerCell.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 29.01.2021.
//

import UIKit

final class ShimmerCell: UITableViewCell {
	private let _titleShimmer = UIView(cornerRadius: 6)
	private let _imageShimmer = UIView(cornerRadius: 6)
	private let _textShimmerFirst = UIView(cornerRadius: 6)
	private let _textShimmerSecond = UIView(cornerRadius: 6)
	private let _textShimmerThird = UIView(cornerRadius: 6)
	private let _additionalInfoShimmer = UIView(cornerRadius: 6)

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		contentView.addSubview(_titleShimmer, constraints: [
			equal(\.leftAnchor, to: contentView, \.leftAnchor, constant: .baseOffset),
			equal(\.widthAnchor, constant: .titleWidth),
			equal(\.heightAnchor, constant: .titleHeight),
			equal(\.topAnchor, to: contentView, \.topAnchor, constant: .baseOffset)
		])

		contentView.addSubview(_imageShimmer, constraints: [
			equal(\.topAnchor, to: _titleShimmer, \.bottomAnchor, constant: .imageToTitleOffset),
			equal(\.leftAnchor, to: contentView, \.leftAnchor, constant: .baseOffset),
			equal(\.rightAnchor, to: contentView, \.rightAnchor, constant: -.baseOffset),
			equal(\.heightAnchor, constant: .imageHeight)
		])

		contentView.addSubview(_textShimmerFirst, constraints: [
			equal(\.topAnchor, to: _imageShimmer, \.bottomAnchor, constant: .imageToTitleOffset),
			equal(\.leftAnchor, to: contentView, \.leftAnchor, constant: .baseOffset),
			equal(\.rightAnchor, to: contentView, \.rightAnchor, constant: -.baseOffset),
			equal(\.heightAnchor, constant: .textHeight)
		])

		contentView.addSubview(_textShimmerSecond, constraints: [
			equal(\.topAnchor, to: _textShimmerFirst, \.bottomAnchor, constant: .imageToTitleOffset),
			equal(\.leftAnchor, \.leftAnchor, constant: .baseOffset),
			equal(\.rightAnchor, \.rightAnchor, constant: -.baseOffset),
			equal(\.heightAnchor, constant: .textHeight)
		])

		contentView.addSubview(_textShimmerThird, constraints: [
			equal(\.topAnchor, to: _textShimmerSecond, \.bottomAnchor, constant: .imageToTitleOffset),
			equal(\.leftAnchor, \.leftAnchor, constant: .baseOffset),
			equal(\.rightAnchor, \.rightAnchor, constant: -.thirdTextRightOffset),
			equal(\.heightAnchor, constant: .textHeight)
		])

		contentView.addSubview(_additionalInfoShimmer, constraints: [
			equal(\.topAnchor, to: _textShimmerThird, \.bottomAnchor, constant: .additionalInfoToThirdText),
			equal(\.leftAnchor, to: contentView, \.leftAnchor, constant: .baseOffset),
			equal(\.heightAnchor, constant: .baseOffset),
			equal(\.widthAnchor, constant: .additionalInfoWidth),
			equal(\.bottomAnchor, constant: -.additionalInfoToThirdText)
		])

		let view = UIView()
		view.backgroundColor = .clear
		selectedBackgroundView = view
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension ShimmerCell: Shimmerable {
	func getSubViewsForAnimate() -> [UIView] {
		return [_titleShimmer, _imageShimmer, _textShimmerFirst, _textShimmerSecond, _textShimmerThird, _additionalInfoShimmer]
	}
}

// MARK: - Constraints
private extension CGFloat {
	static let baseOffset: CGFloat = 16
	static let imageToTitleOffset: CGFloat = 12
	static let titleWidth: CGFloat = 200
	static let titleHeight: CGFloat = 24
	static let imageHeight: CGFloat = 200
	static let textHeight: CGFloat = 12
	static let thirdTextRightOffset: CGFloat = 59
	static let additionalInfoToThirdText: CGFloat = 28
	static let additionalInfoWidth: CGFloat = 120
}
