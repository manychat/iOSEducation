//
//  Repository.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 11.03.2021.
//

import Foundation
import CoreData

protocol TemplateRepositoryInput {
	func save(object: Template) -> Operation
}

final class TemplateRepository: Repository<Template> { }

extension TemplateRepository: TemplateRepositoryInput { }

//let temp2: TemplateRepositoryInput = TemplateRepository()

//class AnyRepository<Element> {
//	let _saveFunc: (_ object: Element) -> Void
//
//	init<I>(_ repository: I) where Element == I.T, I : RepositoryInput {
//		_saveFunc = repository.save
//	}
//
//	func save(object: Element) {
//		_saveFunc(object)
//	}
//}
//
//class AnyRepositoryV2 {
//	let _saveFunc: (_ object: NSManagedObject) -> Void
//
//	init<I>(_ repository: I) where I : RepositoryInput {
//		_saveFunc = { object in
//			guard let object = object as? I.T else { return }
//			repository.save(object: object)
//		}
//	}
//}

class Repository<T: DatabaseMappable> {
	private let _context: NSManagedObjectContext

	init(context: NSManagedObjectContext) {
		_context = context
	}

	func save(object: T) -> Operation {
		return SaveOperation(context: _context, object: object)
	}
}

final class SaveOperation<T: DatabaseMappable>: AsyncOperation {
	internal init(context: NSManagedObjectContext, object: T) {
		self.context = context
		self.object = object
	}

	let object: T
	let context: NSManagedObjectContext

	override func main() {
		super.main()

		context.perform { [weak self] in
			guard let self = self else { return }
			guard let entityDescription = NSEntityDescription.entity(
					forEntityName: T.ObjectType.name,
					in: self.context) else {
				return
			}
			let databaseObject = T.ObjectType(entity: entityDescription, insertInto: self.context)
			let object = self.object.toDatabaseModel(object: databaseObject)
			self.context.insert(object)
			do {
				try self.context.save()
			} catch {
				print(error)
			}
		}
	}
}

enum OptionalV2<T> {
	case value(T)
	case none
}

protocol EntintyNameGetable {
	static var name: String { get }
}

extension NSManagedObject: EntintyNameGetable {
	static var name: String {
		return String(describing: self)
	}
}

protocol DatabaseMappable {
	associatedtype ObjectType: NSManagedObject

	func toDatabaseModel(object: ObjectType) -> ObjectType

	static func toPlainObject(object: ObjectType) -> Self
}

extension Template: DatabaseMappable {
	func toDatabaseModel(object: TemplateMO) -> TemplateMO {
		object.id = Int64(id)
		object.title = title
		object.descript = description
		object.coverURL = coverURL.absoluteString
		object.proStatus = Int16(proStatus)

		return object
	}

	static func toPlainObject(object: ObjectType) -> Template {
		return Template(
			id: Int(object.id),
			title: object.title!,
			description: object.descript!,
			coverURL: URL(string: object.coverURL!)!,
			proStatus: Int(object.proStatus))
	}

	typealias ObjectType = TemplateMO
}
