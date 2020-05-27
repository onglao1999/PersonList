//
//  customTableViewCell.swift
//  PhoneBookIphone
//
//  Created by Ong_Lao_Ngao on 5/26/20.
//  Copyright © 2020 Ong_Lao_Ngao. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutName()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func layoutName(){
        name.translatesAutoresizingMaskIntoConstraints = false
        name.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
        name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        name.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        name.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
    }
}
