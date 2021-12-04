//
//  ItemRepository.swift
//  SwiftUISamples
//
//  Created by Jason Anderson on 12/4/21.
//

import Foundation
import CoreData
import Combine

final class ItemRepository {
    
    // TODO: use this for managing data from multiple sources instead of consuming core data provider in the viewmodel directly
    func observeItems() -> AnyPublisher<[ItemModel], Never> {
        return Just([]).eraseToAnyPublisher()
    }
}
