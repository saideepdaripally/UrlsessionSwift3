//
//  EvnetTableViewCell.swift
//  MeetUpDEmo
//
//  Created by Kvana Dev Ipod on 30/12/16.
//  Copyright © 2016 Kvana DevInc. All rights reserved.
//

import UIKit

class EvnetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventNameLbl: UILabel!
    
    @IBOutlet weak var eventAddressLbl: UILabel!
    
    @IBOutlet weak var eventTimeLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
