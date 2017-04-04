//
//  ContactType+CoreDataProperties.swift
//  MyContacts
//
//  Created by Yawo Echitey on 4/3/17.
//  Copyright © 2017 Echitey. All rights reserved.
//

import Foundation
import CoreData


extension ContactType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactType> {
        return NSFetchRequest<ContactType>(entityName: "ContactType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toContact: NSSet?

}

// MARK: Generated accessors for toContact
extension ContactType {

    @objc(addToContactObject:)
    @NSManaged public func addToToContact(_ value: Contact)

    @objc(removeToContactObject:)
    @NSManaged public func removeFromToContact(_ value: Contact)

    @objc(addToContact:)
    @NSManaged public func addToToContact(_ values: NSSet)

    @objc(removeToContact:)
    @NSManaged public func removeFromToContact(_ values: NSSet)

}
