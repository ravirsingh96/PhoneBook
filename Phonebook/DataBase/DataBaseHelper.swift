//
//  DataBaseHelper.swift
//  Phonebook
//
//  Created by Ravi Singh on 05/07/19.
//  Copyright © 2019 ravi singh. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class DataBaseHelper : NSObject {
    
    
    static let shareInstance = DataBaseHelper()
    var arrayPeople = [People]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func peopleDetail(peopleDic:[String: String]){
        let people = NSEntityDescription.insertNewObject(forEntityName: "People", into: context) as! People
        
        people.firstname = peopleDic["peopleFirstname"]
        people.lastname = peopleDic ["peopleLastName"]
        people.mobile = peopleDic ["peopleMobile"]
      
        people.email = peopleDic ["peopleEmail"]
       
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func getAllData() -> [People] {
        var arrayPeople = [People]()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "People")
        do {
            arrayPeople = try context.fetch(fetchRequest) as! [People]
        }catch{
            print("error in get data")
        }
        return arrayPeople
    }
    
    func deleteData(index: Int) -> [People]{
        var people = getAllData()
        context.delete(people[index])
        people.remove(at: index)
        do {
            try context.save()
        } catch {
            print("cannot delete data ")
        }
        
       return people
    }
}
