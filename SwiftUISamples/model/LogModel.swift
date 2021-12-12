//
//  LogModel.swift
//  SwiftUISamples
//
//  Created by Jason Anderson on 12/12/21.
//

import Foundation
import HardwareConnectionFramework

public struct LogModel: Identifiable {
    private let log: NightLightLog
    
    public let id: UUID = UUID()
    
    public var lightIndex: Int {
        return log.lightIndex
    }
    
    public var logDate: String {
        return DateFormatter.logFormatter.string(from: log.createdAt)
    }
    
    public init(log: NightLightLog) {
        self.log = log
    }
}
