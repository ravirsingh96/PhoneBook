//
//  ContactEditController.swift
//  Phonebook
//
//  Created by Ravi Singh on 05/07/19.
//  Copyright © 2019 ravi singh. All rights reserved.
//

import UIKit

class ContactEditController: UIViewController {
    
    @IBOutlet weak var firstNameTxt: UITextField!
    
    @IBOutlet weak var lstNameTxt: UITextField!
    
    @IBOutlet weak var mobileTxt: UITextField!
    
    @IBOutlet weak var emailtxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func contactEditButton(_ sender: Any) {
        
       let _ = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.popToRootViewController(animated: true)
    }
}
