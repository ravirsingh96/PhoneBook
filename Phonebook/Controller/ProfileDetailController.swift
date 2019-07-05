//
//  ProfileDetailController.swift
//  Phonebook
//
//  Created by Ravi Singh on 05/07/19.
//  Copyright © 2019 ravi singh. All rights reserved.
//

import UIKit

class ProfileDetailController: UIViewController, PassData {
  
    @IBOutlet weak var emailTxt: UILabel!
    @IBOutlet weak var mobileTxt: UILabel!
    @IBOutlet weak var lastNameTxt: UILabel!
    @IBOutlet weak var firstNameTxt: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func data(object: [String : String]) {
        firstNameTxt.text = object["firstname"]
        lastNameTxt.text = object["lastname"]
        mobileTxt.text = object["mobile"]
        emailTxt.text = object["email"]
    }
}
