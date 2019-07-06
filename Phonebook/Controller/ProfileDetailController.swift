//
//  ProfileDetailController.swift
//  Phonebook
//
//  Created by Ravi Singh on 05/07/19.
//  Copyright © 2019 ravi singh. All rights reserved.
//

import UIKit

protocol PassData {
    func data (object: [String:String])
}

 
class ProfileDetailController: UIViewController {
  
    @IBOutlet weak var emailTxt: UILabel!
    @IBOutlet weak var mobileTxt: UILabel!
    @IBOutlet weak var lastNameTxt: UILabel!
    @IBOutlet weak var firstNameTxt: UILabel!
    
    var people: People? {
        didSet {
            emailTxt.text = people?.email
            mobileTxt.text = people?.mobile
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
      
    @IBAction func editContactButton(_ sender: Any) {
        let editVC = self.storyboard?.instantiateViewController(withIdentifier: "ContactEditController") as! ContactEditController
        navigationController?.pushViewController(editVC, animated: true)
        
    }
}
