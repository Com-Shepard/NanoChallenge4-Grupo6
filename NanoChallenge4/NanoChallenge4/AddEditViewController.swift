//
//  AddEditViewController.swift
//  NanoChallenge4
//
//  Created by Douglas Cardoso Ferreira on 28/05/20.
//  Copyright © 2020 Denys Roger. All rights reserved.
//

import UIKit

class AddEditViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfCategory: UITextField!
    @IBOutlet weak var dpDeadline: UIDatePicker!
    @IBOutlet weak var btAddEdit: UIButton!
    @IBOutlet weak var btCover: UIButton!
    @IBOutlet weak var ivCover: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addEditCover(_ sender: UIButton) {
    }
    
    @IBAction func addEditTask(_ sender: Any) {
    }

}
