//
//  CategoriasTableViewController.swift
//  NanoChallenge4
//
//  Created by Douglas Cardoso Ferreira on 28/05/20.
//  Copyright © 2020 Denys Roger. All rights reserved.
//

import UIKit

class CategoriasTableViewController: UITableViewController {
    
    var categoriesManager = CategoriasManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
    func loadCategories() {
        categoriesManager.loadCategories(with: context)
        tableView.reloadData()
    }
    
    @IBAction func addCategory(_ sender: UIBarButtonItem) {
        showAlert(with: nil)
    }
    
    func showAlert(with category: Category?) {
        let title = category == nil ? "Adicionar" : "Editar"
        let alert = UIAlertController(title: title + " plataforma", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Nome da categoria"
            if let name = category?.name {
                textField.text = name
            }
        }
        alert.addAction(UIAlertAction(title: title, style: .default, handler: { (action) in
            let category = category ?? Category(context: self.context)
            category.name = alert.textFields?.first?.text
            do {
                try self.context.save()
                self.loadCategories()
            } catch {
                print(error.localizedDescription)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.view.tintColor = UIColor(named: "second")
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoriesManager.categories.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categoriesManager.categories[indexPath.row]
        showAlert(with: category)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            categoriesManager.deleteCategory(index: indexPath.row, context: context)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let category = categoriesManager.categories[indexPath.row]
        cell.textLabel?.text = category.name

        return cell
    }

}
