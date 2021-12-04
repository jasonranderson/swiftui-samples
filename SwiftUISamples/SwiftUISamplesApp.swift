//
//  SwiftUISamplesApp.swift
//  SwiftUISamples
//
//  Created by Jason Anderson on 11/13/21.
//

import SwiftUI

@main
struct SwiftUISamplesApp: App {
    @StateObject private var viewModelFactory = ViewModelFactory()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModelFactory)
        }
    }
}
