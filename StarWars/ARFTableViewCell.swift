//
//  ARFTableViewCell.swift
//  StarWars
//
//  Created by Alejandro Rodriguez on 5/13/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

import UIKit

@objc(ARFTableViewCell)

class ARFTableViewCell: UITableViewCell {


    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var lblCharacterName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
