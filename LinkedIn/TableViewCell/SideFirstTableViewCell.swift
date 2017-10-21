//
//  SideFirstTableViewCell.swift
//  LinkedIn
//
//  Created by Sierra 4 on 28/03/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit

class SideFirstTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!

    @IBOutlet weak var imgDetails: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
