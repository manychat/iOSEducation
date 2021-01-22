//
//  ViewController.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 21.01.2021.
//

import UIKit

class ViewController: UIViewController {
	let label = UILabel()

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .white
		view.addSubview(label)

		label.text = "Test"
		label.translatesAutoresizingMaskIntoConstraints = false

		[
			label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
			label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
			label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		].forEach { constraint in
			constraint.isActive = true
		}
		label.textAlignment = .center
	}
}
