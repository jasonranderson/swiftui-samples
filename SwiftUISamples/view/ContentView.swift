//
//  ContentView.swift
//  SwiftUISamples
//
//  Created by Jason Anderson on 11/13/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModels: ViewModelFactory
    
    var body: some View {
//        ItemListView(viewModel: viewModels.viewModel())
        LogView(viewModel: viewModels.viewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewModelFactory())
    }
}
