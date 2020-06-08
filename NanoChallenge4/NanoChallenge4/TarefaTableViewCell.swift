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
    
    func prepare(with task: Task) {
        lbName.text = task.name ?? ""
        lbCategory.text = task.category?.name ?? ""
        if let deadline = task.deadline {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy' 'HH:mm"
            formatter.locale = Locale(identifier: "pt-BR")
            lbDeadline.text = "Prazo: " + formatter.string(from: deadline)
        }
        if let image = task.cover as? UIImage {
            ivCover.image = image
        } else {
            ivCover.image = UIImage(named: "noCover")
        }
    }
    
}
