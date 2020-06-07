//
//  StartViewController.swift
//  NanoChallenge4
//
//  Created by Denys Roger on 27/05/20.
//  Copyright © 2020 Denys Roger. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var background1: UIButton!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var buttonNext: UIButton!
    var count = 0
    var welcome : Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background1.layer.cornerRadius = 15
        text1.layer.cornerRadius = 15
        text2.layer.cornerRadius = 15
        buttonNext.layer.cornerRadius = 15
        
        fillLabel(countFunc: count)
    }
    
    func fillLabel(countFunc : Int){
        let texts = ["I-Signment é um app que busca ajudar na organização das suas tarefas e do seu tempo. Com ele você vai começar a economizar tempo na sua agenda, e terá seu trabalho na palma da sua mão. Pronto para começar?" , "Nas próximas telas vou dar algumas instruções para você de como utilizar o app, em breve você vai estar pronto para fazer tudo sozinho." , "Primeiro o básico, para adicionar novas tarefas você só precisa pressionar o simbolo de adição no canto superior direito da tela" , "Ele levará você a tela de adição de tarefas. La você poderá especificar como deseja anotar sua tarefa." , "Aqui você poderá criar sua tarefa. Defina um nome, escolha uma categoria, e anote a data." , "Tudo isso vai servir para que você não se esqueça do que tem que fazer e até quando você tem tempo para cumprir esta tarefa" , "Você também pode adicionar uma imagem a tarefa caso queira, apenas clique no texto e escolha a imagem da sua galeria" , "Para finalizar clique em adicionar, sua tarefa estará na tela inicial do app sempre que você precisar olhar." , "Ah, e para adicionar uma nova categoria, basta adicionar uma nova na aba categorias", "É bem simples e se parece muito com o que você ja aprendeu a fazer com as tarefas. Agora você ja sabe tudo que precisa para começar, vamos la."]
        let images = [UIImage(named: "Logo"),UIImage(named: "New One"),UIImage(named: "New Details"),UIImage(named: "New Add"),UIImage(named: "New categ")]
        
        if count == 0 {
            text1.text = texts[0]
            text2.text = texts[1]
            image1.image = images[0]
        }
        else if count == 1{
            text1.text = texts[2]
            text2.text = texts[3]
            image1.image = images[1]
        }
        else if count == 2{
        text1.text = texts[4]
        text2.text = texts[5]
        image1.image = images[2]
        }
        else if count == 3{
        text1.text = texts[6]
        text2.text = texts[7]
        image1.image = images[3]
        }
        else if count == 4{
        text1.text = texts[8]
        text2.text = texts[9]
        image1.image = images[4]
        }
    }
    
    @IBAction func buttonNext(_ sender: Any) {
        count += 1
        fillLabel(countFunc: count)
        if count == 5{
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
