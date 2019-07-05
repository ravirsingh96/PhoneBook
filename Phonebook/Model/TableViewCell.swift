//
//  TableViewCell.swift
//  Phonebook
//
//  Created by Ravi Singh on 05/07/19.
//  Copyright © 2019 ravi singh. All rights reserved.
//

import UIKit
import CoreData

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    var people: People? {
        didSet {
            nameLbl.text = people?.firstname
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
