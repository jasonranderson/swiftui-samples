//
//  ViewModelFactory.swift
//  SwiftUISamples
//
//  Created by Jason Anderson on 12/4/21.
//

import Foundation
import Combine
import CoreData

open class BaseViewModel: NSObject, ObservableObject {
    lazy var cancellables: Set<AnyCancellable> = {
        return Set<AnyCancellable>()
    }()
    
    let modelProvider: ModelProvider
    
    required public init(_ modelProvider: ModelProvider) {
        self.modelProvider = modelProvider
    }
}

final class ViewModelFactory: ObservableObject {
    let modelProvider = ModelProvider()
    
    func viewModel<T: BaseViewModel>() -> T {
        return T(modelProvider)
    }
}
