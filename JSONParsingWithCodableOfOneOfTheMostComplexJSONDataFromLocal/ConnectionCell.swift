//  ConnectionCell.swift
//  JSONParsingWithCodableOfOneOfTheMostComplexJSONDataFromLocal
//  Created by Ranjeet Raushan on 12/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit

class ConnectionCell: UITableViewCell {
    @IBOutlet weak var img_connections: UIImageView!
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_designation: UILabel!
    @IBOutlet weak var lbl_company: UILabel!
    @IBOutlet weak var lbl_addresse: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
