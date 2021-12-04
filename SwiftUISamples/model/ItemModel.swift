//
//  ItemModel.swift
//  SwiftUISamples
//
//  Created by Jason Anderson on 11/14/21.
//

import Foundation
import CoreData

public struct ItemModel: Identifiable {
    private let item: ItemEntity

    public var id: ObjectIdentifier {
        return item.id
    }
    
    public var title: String {
        return item.title ?? ""
    }
    
    public var order: Int {
        return Int(item.order)
    }
    
    public init(item: ItemEntity) {
        self.item = item
    }
    
    public func delete(context: NSManagedObjectContext) {
        context.delete(item)
    }
    
    public func updateOrder(_ order: Int) {
        item.order = Int16(order)
    }
}
