//
//  SquadPlayerTableViewCell.swift
//  ManchesterUnitedSquad
//
//  Created by clicklabs on 24/06/20.
//  Copyright © 2020 clicklabs. All rights reserved.
//

import UIKit

class SquadPlayerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
