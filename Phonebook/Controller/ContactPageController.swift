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
    

    @IBAction func saveButton(_ sender: UIButton) {
    
        peopleSaveData()
        
         let _ = self.storyboard?.instantiateViewController(withIdentifier: "ContactPageController") as! ContactPageController
        navigationController?.popToRootViewController(animated: true)
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
