//
//  TarefaTableViewCell.swift
//  NanoChallenge4
//
//  Created by Douglas Cardoso Ferreira on 28/05/20.
//  Copyright © 2020 Denys Roger. All rights reserved.
//

import UIKit

class TarefaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivCover: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbCategory: UILabel!
    @IBOutlet weak var lbDeadline: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
