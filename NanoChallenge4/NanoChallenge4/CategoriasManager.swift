//
//  TarefasManager.swift
//  NanoChallenge4
//
//  Created by Douglas Cardoso Ferreira on 02/06/20.
//  Copyright © 2020 Denys Roger. All rights reserved.
//

import CoreData

class CategoriasManager {
    
    static let shared = CategoriasManager()
    var categories: [Category] = []
    
    func loadCategories(with context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        let shortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [shortDescriptor]
        do {
            categories = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteCategory(index: Int, context: NSManagedObjectContext) {
        let category = categories[index]
        context.delete(category)
        do {
            try context.save()
            categories.remove(at: index)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private init() {
        
    }
}
