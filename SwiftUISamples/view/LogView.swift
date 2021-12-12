//
//  LogView.swift
//  SwiftUISamples
//
//  Created by Jason Anderson on 12/12/21.
//

import SwiftUI

struct LogView: View {
    @ObservedObject var viewModel: NightLightViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(viewModel.listStatus, id: \.lightIndex) { status in
                        if status.isOn {
                            Circle()
                                .fill(Color.yellow)
                        } else {
                            Circle()
                                .fill(Color.gray)
                        }
                        
                    }
                }
                List {
                    ForEach(viewModel.logs) { log in
                        Text(log.logDate)
                    }
                }.listStyle(.plain)
            }
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView(viewModel: ViewModelFactory().viewModel())
    }
}
