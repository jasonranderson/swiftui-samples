//
//  ModelProvider.swift
//  SwiftUISamples
//
//  Created by Jason Anderson on 11/14/21.
//

import UIKit
import CoreData

public final class ModelProvider {
    private let container = NSPersistentContainer(name: "Model")
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    func performInBackground(_ block: @escaping (NSManagedObjectContext) -> Void) {
        container.performBackgroundTask(block)
    }
    
    func saveContext(_ context: NSManagedObjectContext) {
        guard context.hasChanges else {
            return
        }
        try? context.save()
    }
    
    init() {
        container.loadPersistentStores { description, error in
            if error == nil {
                var values = URLResourceValues()
                values.isExcludedFromBackup = true
                try? description.url?.setResourceValues(values)
            }
        }
    }
}
