//
//  ContactEditController.swift
//  Phonebook
//
//  Created by Ravi Singh on 05/07/19.
//  Copyright © 2019 ravi singh. All rights reserved.
//

import UIKit

class ContactEditController: UIViewController, PassData {
    
    @IBOutlet weak var firstNameTxt: UITextField!
    
    @IBOutlet weak var lstNameTxt: UITextField!
    
    @IBOutlet weak var mobileTxt: UITextField!
    
    @IBOutlet weak var emailtxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func validate(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    @IBAction func editDoneButton(_ sender: Any) {
       
        if (emailtxt.text!.isValidEmail) {
            print("Email is valid")
        }else {
            print("Email is not valid")
        }

        if validate(value: mobileTxt.text!){
            print("Valid Number")
        }else {
            print("Not Valid")
        }
        
       let _ = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.popToRootViewController(animated: true)
    }
    
    func data(object: [String : String]) {
        firstNameTxt.text = object["firstname"]
        lstNameTxt.text = object["lastname"]
        mobileTxt.text = object["mobile"]
        emailtxt.text = object["email"]
    }

}
extension String {
    
    var isValidEmail: Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        return emailPredicate.evaluate(with: self)
    }
    
//    var isValidPhone: Bool {
//        if self.isValidPhone == true {
//            let phoneRegex = "[235689][0-9]{6}([0-9]{3})?"
//            let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
//            return  predicate.evaluate(with: self)
//        }else {
//            return false
//        }
//    }
    
}
