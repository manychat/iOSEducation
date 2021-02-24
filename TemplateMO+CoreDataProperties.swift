//
//  TemplateMO+CoreDataProperties.swift
//  
//
//  Created by Aleksandr Lavrinenko on 24.02.2021.
//
//

import Foundation
import CoreData


extension TemplateMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TemplateMO> {
        return NSFetchRequest<TemplateMO>(entityName: "TemplateMO")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var coverURL: String?
    @NSManaged public var descript: String?
    @NSManaged public var proStatus: Int16

}
