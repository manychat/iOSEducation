//
//  TemplatesContrainer.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 05.02.2021.
//

import Foundation

struct TemplatesContrainer {
	let templates: [Template]
}

extension TemplatesContrainer: Decodable { }

struct Template {
	let id: Int
	let title: String
	let description: String
	let coverURL: URL
	let proStatus: Int
}

extension Template: Decodable {
	enum CodingKeys: String, CodingKey {
		case id = "template_id"
		case title
		case description = "subtitle"
		case coverURL = "cover_url"
		case proStatus = "pro_status"
	}
}
