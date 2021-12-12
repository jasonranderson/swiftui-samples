//
//  NightLightViewModel.swift
//  SwiftUISamples
//
//  Created by Jason Anderson on 12/12/21.
//

import Foundation
import Combine
import SwiftUI
import CoreData
import HardwareConnectionFramework

final class NightLightViewModel: BaseViewModel {
    @Published private(set) var listStatus: [NightLightStatus] = []
    @Published private(set) var logs: [LogModel] = []
    
    private func fetchData() {
        HCFClient.shared.searchForPeripherals(ofType: .nightLight) { peripherals in
            guard let peripheral = peripherals.first else {
                return
            }
            self.observeData(peripheral: peripheral)
        }
    }
    
    private func observeData(peripheral: HCFPeripheral) {
        peripheral.observeDataStream()
            .receive(on: DispatchQueue.main)
            .sink { models in
                var tempLogs: [NightLightLog] = []
                var tempStatus: [NightLightStatus] = []
                for model in models {
                    if model is NightLightStatus {
                        if let status = model as? NightLightStatus {
                            tempStatus.append(status)
                        }
                    } else if model is NightLightLog {
                        if let log = model as? NightLightLog {
                            tempLogs.append(log)
                        }
                    }
                }
                self.listStatus = tempStatus
                self.logs = tempLogs.map {
                    LogModel(log: $0)
                }
            }.store(in: &cancellables)
    }
    
    required init(_ modelProvider: ModelProvider) {
        super.init(modelProvider)
        fetchData()
    }
}
