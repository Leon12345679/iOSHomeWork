//
//  SettingsCell.swift
//  HMWK3
//
//  Created by Leon Vladimirov on 10/28/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {

    static let reuseIdentifier = "settingsCell"
    
    let settingLabel: UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        settingLabel.frame = CGRect(x: 10,
                                    y: self.contentView.frame.origin.y,
                                    width: self.contentView.frame.width,
                                    height: self.contentView.frame.height)
        
        settingLabel.textColor = .black
        settingLabel.adjustsFontSizeToFitWidth = true
        
        contentView.addSubview(settingLabel)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
