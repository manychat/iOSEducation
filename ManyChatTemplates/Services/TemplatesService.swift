//
//  TemplatesService.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 05.02.2021.
//

import Foundation
import Alamofire

protocol TemplateServiceInterface {
	func list(completion: @escaping (_ result: Result<[Template], Error>) -> Void) -> TemplateListOperation
}

final class TemplatesService { }

extension TemplatesService: TemplateServiceInterface {
	func list(completion: @escaping (_ result: Result<[Template], Error>) -> Void) -> TemplateListOperation {
		let url = URL(string: "https://manychat.com/templateStore/templatesList")!
		return TemplateListOperation(url: url)
//		let request = AF.request(url, method: .get)
//			.responseDecodable(queue: .global(), completionHandler: { (response: DataResponse<TemplatesContrainer, AFError>) in
//				switch response.result {
//				case .success(let templatesContainer):
//					completion(.success(templatesContainer.templates))
//				case .failure(let error):
//					completion(.failure(error))
//				}
//			})
//
//		request.cURLDescription { (description) in
//			print(description)
//		}
	}
}
