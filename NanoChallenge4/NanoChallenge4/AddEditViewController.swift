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
    
    var task: Task!
    lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = .white
        return pickerView
    }()
    var categoriesManager = CategoriasManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        if task != nil {
            title = "Editar tarefa"
            btAddEdit.setTitle("ALTERAR", for: .normal)
            tfName.text = task.name
            if let category = task.category, let index = categoriesManager.categories.index(of: category) {
                tfCategory.text = category.name
                pickerView.selectRow(index, inComponent: 0, animated: false)
            }
            ivCover.image = task.cover as? UIImage
            if let deadline = task.deadline {
                dpDeadline.date = deadline
            }
            if task.cover != nil {
                btCover.setTitle(nil, for: .normal)
            }
        }
        prepareTaskTextField()
    }
    
    func prepareTaskTextField() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        toolbar.tintColor = UIColor(named: "main")
        let btCancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        let btDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let btFlexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [btCancel, btFlexibleSpace, btDone]
        tfCategory.inputView = pickerView
        tfCategory.inputAccessoryView = toolbar
    }
    
    @objc func cancel() {
        tfCategory.resignFirstResponder()
    }
    
    @objc func done() {
        tfCategory.text = categoriesManager.categories[pickerView.selectedRow(inComponent: 0)].name
        
        
        cancel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        categoriesManager.loadCategories(with: context)
    }
    
    @IBAction func addEditCover(_ sender: UIButton) {
        let alert = UIAlertController(title: "Selecionar poster", message: "De onde você quer escolher o poster?", preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Câmera", style: .default, handler: { (action: UIAlertAction) in
                self.selectPicture(sourceType: .camera)
            })
            alert.addAction(cameraAction)
        }
        let libraryAction = UIAlertAction(title: "Biblioteca de fotos", style: .default) { (action: UIAlertAction) in
            self.selectPicture(sourceType: .photoLibrary)
        }
        alert.addAction(libraryAction)
        let photosAction = UIAlertAction(title: "Álbum de fotos", style: .default) { (action: UIAlertAction) in
            self.selectPicture(sourceType: .savedPhotosAlbum)
        }
        alert.addAction(photosAction)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func selectPicture(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        imagePicker.navigationBar.tintColor = UIColor(named: "main")
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addEditTask(_ sender: Any) {
        if task == nil {
            task = Task(context: context)
        }
        task.name = tfName.text
        task.deadline = dpDeadline.date
        if !tfCategory.text!.isEmpty {
            let category = categoriesManager.categories[pickerView.selectedRow(inComponent: 0)]
            task.category = category
        }
        task.cover = ivCover.image
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        navigationController?.popViewController(animated: true)
    }

}

extension AddEditViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoriesManager.categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let category = categoriesManager.categories[row]
        return category.name
    }
}

extension AddEditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        ivCover.image = image
        btCover.setTitle(nil, for: .normal)
        dismiss(animated: true, completion: nil)
    }
}
