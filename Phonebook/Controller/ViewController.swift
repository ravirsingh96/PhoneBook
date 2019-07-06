//
//  ViewController.swift
//  Phonebook
//
//  Created by Ravi Singh on 05/07/19.
//  Copyright © 2019 ravi singh. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
  
    @IBOutlet weak var peopleListView: UITableView!
    var arrapeople = [People]()
   // var list: List?
    var delegate:PassData!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
      arrapeople = DataBaseHelper.shareInstance.getAllData()
        peopleListView.reloadData()
    }
    
    @IBAction func newCntctButton(_ sender: UIButton) {
        
        let contactVc = self.storyboard?.instantiateViewController(withIdentifier: "ContactPageController") as! ContactPageController
        navigationController?.pushViewController(contactVc, animated: true)
    }

}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrapeople.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.nameLbl.text = arrapeople[indexPath.row].firstname
        cell.imageView?.image = UIImage(named: "icon")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           arrapeople = DataBaseHelper.shareInstance.deleteData(index: indexPath.row)
            self.peopleListView.deleteRows(at: [indexPath], with: .automatic)
        }
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if arrapeople.count != nil {
            let cellVC = self.storyboard?.instantiateViewController(withIdentifier: "profileVC") as! ProfileDetailController
            navigationController?.pushViewController(cellVC, animated: true)
        }
        
        
    
//        let dict = [
//
//            "firstname":arrapeople[indexPath.row].firstname,
//            "lastname": arrapeople[indexPath.row].lastname,
//            "phone": arrapeople[indexPath.row].phone,
//            "mobile": arrapeople[indexPath.row].mobile,
//            "address": arrapeople[indexPath.row].address,
//            "email": arrapeople[indexPath.row].email,
//        ]
//
//        delegate.data(object: dict as! [String:String])
//        self.navigationController?.popViewController(animated: true)
    }
}
