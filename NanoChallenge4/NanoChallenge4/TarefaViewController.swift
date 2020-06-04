//
//  TarefaViewController.swift
//  NanoChallenge4
//
//  Created by Douglas Cardoso Ferreira on 28/05/20.
//  Copyright © 2020 Denys Roger. All rights reserved.
//

import UIKit

class TarefaViewController: UIViewController {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbCategory: UILabel!
    @IBOutlet weak var lbDeadline: UILabel!
    @IBOutlet weak var ivCover: UIImageView!
    
    var task: Task!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lbName.text = task.name
        lbCategory.text = task.category?.name
        if let deadline = task.deadline {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy' 'HH:mm"
            formatter.locale = Locale(identifier: "pt-BR")
            lbDeadline.text = "Prazo: " + formatter.string(from: deadline)
        }
        if let image = task.cover as? UIImage {
            ivCover.image = image
        } else {
            ivCover.image = UIImage(named: "noCoverFull")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddEditViewController
        vc.task = task
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
