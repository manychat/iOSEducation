//
//  TemplateCell.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 05.02.2021.
//

import UIKit
import Kingfisher

final class TemplateCell: UITableViewCell {
	private let _titleLabel = UILabel(numberOfLines: 0)
	private let _contentImageView = UIImageView(contentMode: .scaleAspectFill)
	private let _proIndicator = ProView()
	private let _descriptionLabel = BodySecondLabel(numberOfLines: 0)

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)


		let stackView = _createVerticalStackView()
		stackView.addArrangedSubview(_titleLabel)
		stackView.addArrangedSubview(_contentImageView, constraints: [equal(\.heightAnchor, constant: ._imageHeight)])
		stackView.addArrangedSubview(_descriptionLabel)

		contentView.addSubview(stackView, constraints: [
			equal(\.leadingAnchor, constant: 16),
			equal(\.trailingAnchor, constant: -16),
			equal(\.bottomAnchor, constant: -._defaultSpacing),
			equal(\.topAnchor, constant: ._topContentOffset)
		])

		_contentImageView.addSubview(_proIndicator, constraints: [
			equal(\.trailingAnchor, constant: -._defaultSpacing),
			equal(\.bottomAnchor, constant: -._defaultSpacing)
		])
	}

	required init?(coder: NSCoder) {
		fatalError()
	}

	private func _createVerticalStackView() -> UIStackView {
		let stackView = UIStackView()
		stackView.distribution = .equalSpacing
		stackView.spacing = ._defaultSpacing
		stackView.axis = .vertical
		return stackView
	}

	func configure(viewModel: ViewModel) {
		_titleLabel.text = viewModel.title
		_descriptionLabel.text = viewModel.description
		_contentImageView.kf.setImage(with: viewModel.imageURL, options: [.forceRefresh])
		_proIndicator.isHidden = !viewModel.isPro
	}
}

extension TemplateCell {
	struct ViewModel {
		let title: String
		let description: String
		let imageURL: URL
		let isPro: Bool
	}
}

fileprivate extension CGFloat {
	static let _defaultSpacing: Self = 12
	static let _leadingTralingOffset: Self = 16
	static let _topContentOffset: Self = 20
	static let _imageHeight: Self = 200
}
