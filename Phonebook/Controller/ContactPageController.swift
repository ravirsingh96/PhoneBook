//
//  ContactPageController.swift
//  Phonebook
//
//  Created by Ravi Singh on 05/07/19.
//  Copyright © 2019 ravi singh. All rights reserved.
//

import UIKit

class ContactPageController: UIViewController {
    
    @IBOutlet weak var firstNameTxtFld: UITextField!
    
    @IBOutlet weak var lastNameTxtFld: UITextField!
    
    @IBOutlet weak var mobileTxtFld: UITextField!

    @IBOutlet weak var emailTxtFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

 private func validate(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
    
        if emailTxtFld.text!.didValidEmail {
            print("Email is Valid")
        }else {
            print("Email is not Valid")
        }
        if validate(value: mobileTxtFld.text!){
            print("Valid Number")
        }else {
            print("Number is Invalid")
        }
        
         let _ = self.storyboard?.instantiateViewController(withIdentifier: "ContactPageController") as! ContactPageController
        navigationController?.popToRootViewController(animated: true)
        
        peopleSaveData()
    }
    
}
extension ContactPageController {
    func peopleSaveData(){
        guard let peopleFirstname = firstNameTxtFld.text else {return}
         guard let peopleLastName = lastNameTxtFld.text else {return}
         guard let peopleMobile = mobileTxtFld.text else {return}
         guard let peopleEmail = emailTxtFld.text else {return}
        
        let peopleDic = [
            "peopleFirstname": peopleFirstname,
            "peopleLastName" : peopleLastName,
            "peopleMobile" : peopleMobile,
            "peopleEmail" : peopleEmail
        
        ]
        
        
        DataBaseHelper.shareInstance.peopleDetail(peopleDic: peopleDic)
    }
 
    
}
extension String {
    
    var didValidEmail: Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        return emailPredicate.evaluate(with: self)
    }
    
//    var didValidPhone: Bool {
//        if self.isValidPhone == true {
//            let phoneRegex = "[235689][0-9]{6}([0-9]{3})?"
//            let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
//            return  predicate.evaluate(with: self)
//        }else {
//            return false
//        }
//    }
}
