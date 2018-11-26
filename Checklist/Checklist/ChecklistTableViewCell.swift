//
//  ChecklistTableViewCell.swift
//  Checklist
//
//  Created by Norman Lim on 26/11/2018.
//  Copyright © 2018 Norman Lim. All rights reserved.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {

    @IBOutlet weak var todoTextLabel: UILabel!
    @IBOutlet weak var checkmarkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
