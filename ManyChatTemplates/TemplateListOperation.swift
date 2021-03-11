//
//  TemplateListOperation.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 11.03.2021.
//

import Foundation
import Alamofire


/// Abstraction under Operation for trully asynchronic operation.
open class AsyncOperation: Operation {
	public var state: State = .ready {
		willSet {
			willChangeValue(forKey: newValue.keyPath)
		}
		didSet {
			didChangeValue(forKey: state.keyPath)
		}
	}

	open override var isReady: Bool {
		return super.isReady && state == .ready
	}

	open override var isExecuting: Bool {
		return state == .executing
	}

	open override var isFinished: Bool {
		return state == .finished
	}

	open override var isAsynchronous: Bool {
		return true
	}

	open override func start() {
		guard state != .finished else { return }
		// Operation must always go througt  ready -> executing -> finished states
		state = .executing
		if isCancelled {
			state = .finished
			return
		}

		main()
	}
}

// MARK: - State
public extension AsyncOperation {
	enum State: String {
		case ready
		case executing
		case finished

		fileprivate var keyPath: String {
			return "is\(rawValue.capitalized)"
		}
	}
}

final class TemplateListOperation: AsyncOperation {
	private let _url: URL
	var result: Result<TemplatesContrainer, Error>?

	init(url: URL) {
		_url = url
	}
	override func main() {
		super.main()

		let request = AF.request(_url, method: .get)
			.responseDecodable(
				queue: .global(),
				completionHandler: { [weak self] (response: DataResponse<TemplatesContrainer, AFError>) in
				switch response.result {
				case .success(let templatesContainer):
					self?.result = .success(templatesContainer)
					print(templatesContainer)
				case .failure(let error):
					self?.result = .failure(error)
				}
				self?.state = .finished
			})

		request.cURLDescription { (description) in
			print(description)
		}

	}
}

final class DelayOperantion: AsyncOperation {
	override func main() {
		super.main()
		DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
			self.state = .finished
		}
	}
}
