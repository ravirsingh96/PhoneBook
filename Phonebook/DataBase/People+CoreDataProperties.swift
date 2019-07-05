//
//  People+CoreDataProperties.swift
//  Phonebook
//
//  Created by Ravi Singh on 05/07/19.
//  Copyright © 2019 ravi singh. All rights reserved.
//
//

import Foundation
import CoreData


extension People {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<People> {
        return NSFetchRequest<People>(entityName: "People")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var mobile: String?
    @NSManaged public var email: String?

}
