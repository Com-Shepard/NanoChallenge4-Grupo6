//
//  StartViewController.swift
//  NanoChallenge4
//
//  Created by Denys Roger on 27/05/20.
//  Copyright © 2020 Denys Roger. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var buttonNext: UIButton!
    var count = 0
    var welcome : Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text1.layer.cornerRadius = 15
        text2.layer.cornerRadius = 15
        buttonNext.layer.cornerRadius = 15
        
        fillLabel(countFunc: count)
    }
    
    func fillLabel(countFunc : Int){
        let texts = ["(Nome do app) é um app que busca ajudar na organização das suas tarefas e do seu tempo. Com ele você vai começar a economizar tempo na sua agenda, e terá seu trabalho na palma da sua mão. Esta pronto para começar?","Nas próximas telas vou ensinar dar algumas instruções para você de como utilizar o app, em breve você vai estar pronto para fazer tudo sozinho."]
        
        if count == 0 {
            text1.text = texts[0]
            text2.text = texts[1]
        }
        else if count == 1{
            text1.text = texts[0]
            text2.text = texts[1]
        }
    }
    
    @IBAction func buttonNext(_ sender: Any) {
        count += 1
        fillLabel(countFunc: count)
        if count == 2{
           welcome = false
            UserDefaults.standard.set(welcome, forKey: "UserHasSeenWelcome")
                       let storyboard = UIStoryboard(name: "Main", bundle: nil)
                       let mainVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! UITabBarController
                       self.present(mainVC, animated: true, completion: nil)
        }
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
