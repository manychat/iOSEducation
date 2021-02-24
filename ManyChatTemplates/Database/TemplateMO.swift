//
//  TemplateMO.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 24.02.2021.
//

import Foundation
import CoreData

@objc(TemplateMO)
public class TemplateMO: NSManagedObject {

}

extension TemplateMO {

	@nonobjc public class func fetchRequest() -> NSFetchRequest<TemplateMO> {
		return NSFetchRequest<TemplateMO>(entityName: "TemplateMO")
	}

	@NSManaged public var coverURL: String?
	@NSManaged public var descript: String?
	@NSManaged public var id: Int64
	@NSManaged public var proStatus: Int16
	@NSManaged public var title: String?

}

