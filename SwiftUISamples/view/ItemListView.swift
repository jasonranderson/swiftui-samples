//
//  ItemListView.swift
//  SwiftUISamples
//
//  Created by Jason Anderson on 12/4/21.
//

import SwiftUI

struct ItemListView: View {
    @ObservedObject var viewModel: ItemListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.items) { item in
                        Text(item.title)
                    }
                    .onMove(perform: viewModel.moveItem)
                    .onDelete(perform: viewModel.removeItem)
                }.listStyle(.plain)
                Button("Add") {
                    viewModel.addItem(text: "item")
                }
            }.toolbar {
                EditButton()
            }
            .navigationTitle("Items")
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(viewModel: ViewModelFactory().viewModel())
    }
}
