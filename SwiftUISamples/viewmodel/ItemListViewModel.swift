//
//  ItemListViewModel.swift
//  SwiftUISamples
//
//  Created by Jason Anderson on 12/4/21.
//

import Foundation
import Combine
import SwiftUI
import CoreData

final class ItemListViewModel: BaseViewModel {
    private var fetchedResultsController: NSFetchedResultsController<ItemEntity>?
    
    @Published private(set) var items: [ItemModel] = []
    
    func addItem(text: String) {
        let item = ItemEntity(context: modelProvider.viewContext)
        item.id = UUID()
        item.title = "\(text) \(items.count + 1)"
        item.order = Int16(items.count)
        
        modelProvider.saveContext(modelProvider.viewContext)
    }
    
    func removeItem(at offsets: IndexSet) {
        for index in offsets {
            let item = items[index]
            item.delete(context: modelProvider.viewContext)
        }
        
        modelProvider.saveContext(modelProvider.viewContext)
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        var editItems = items.map { $0 }
        
        editItems.move(fromOffsets: source, toOffset: destination)
        
        for index in stride(from: editItems.count - 1, through: 0, by: -1) {
            editItems[index].updateOrder(index)
        }
        
        modelProvider.saveContext(modelProvider.viewContext)
    }
    
    private func fetchItems() {
        let request = ItemEntity.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(key: "order", ascending: true)
        ]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: modelProvider.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController?.delegate = self
        do {
            print("fetching items")
            try fetchedResultsController?.performFetch()
        } catch {
            print("error \(error.localizedDescription)")
        }
        refreshItems()
    }
    
    required init(_ modelProvider: ModelProvider) {
        super.init(modelProvider)
        fetchItems()
    }
}

extension ItemListViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        refreshItems()
    }
    
    private func refreshItems() {
        items = fetchedResultsController?.fetchedObjects?.compactMap {
            ItemModel(item: $0)
        } ?? []
    }
}
