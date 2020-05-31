//
//  Provider.swift
//  StarterKit
//
//  Created by Matthieu Lagast on 31/05/2020.
//  Copyright © 2020 mlagast. All rights reserved.
//

import Foundation
import CoreData

class Provider <T:NSManagedObject> {
    var managedObjectContext:NSManagedObjectContext! {
        didSet {
            managedObjectContext.mergePolicy =  NSMergeByPropertyObjectTrumpMergePolicy
        }
    }
    var managedObjectType:NSManagedObject.Type {
        return T.self
    }
    var entityName:String!
    
    init(entityName: String, context:NSManagedObjectContext) {
        self.entityName = entityName
        self.managedObjectContext = context
    }
    
    func insertObjectInstance() -> T {
        return NSEntityDescription.insertNewObject(forEntityName: entityName, into: managedObjectContext) as! T
    }
    
    func selectAllObjects() -> [T]? {
        var results:[AnyObject]?
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let entity:NSEntityDescription = NSEntityDescription.entity(forEntityName: entityName, in:managedObjectContext)!
        
        request.entity = entity
        
        do {
            results = try managedObjectContext.fetch(request)
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
        
        return results as? [T]
    }
    
    func selectObjects(predicate: NSPredicate?, sortDescriptors:[NSSortDescriptor]?=nil) -> [T]? {
        var results:[AnyObject]?
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let entity:NSEntityDescription = NSEntityDescription.entity(forEntityName: entityName, in:managedObjectContext)!
        
        request.entity = entity
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        
        do {
            results = try managedObjectContext.fetch(request)
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
        
        return results  as? [T]
    }
    
    func selectObject(predicate: NSPredicate) -> T? {
        var results:[AnyObject]?
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName)
        let entity:NSEntityDescription = NSEntityDescription.entity(forEntityName: self.entityName, in:self.managedObjectContext)!
        
        request.entity = entity
        request.predicate = predicate
        
        do {
            results = try managedObjectContext.fetch(request)
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
        
        if let result = results?.first as? NSManagedObject {
            return result as? T
        } else {
            return nil
        }
    }
    
    func deleteAllObjects() {
        var results:[AnyObject]?
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName)
        let entity:NSEntityDescription = NSEntityDescription.entity(forEntityName: self.entityName, in:self.managedObjectContext)!
        
        request.entity = entity
        request.includesPropertyValues = false
        
        do {
            results = try managedObjectContext.fetch(request)
            if let managedObjectArray = results as? [T] {
                for managedObject in managedObjectArray {
                    managedObjectContext.delete(managedObject)
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func deleteObject(object:T) {
        managedObjectContext.delete(object)
    }
    
    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
