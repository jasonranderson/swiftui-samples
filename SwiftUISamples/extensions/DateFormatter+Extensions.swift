//
//  Date+Extensions.swift
//  SwiftUISamples
//
//  Created by Jason Anderson on 12/12/21.
//

import Foundation

extension DateFormatter {
    static let logFormatter: DateFormatter = {
        let retval = DateFormatter()
        retval.dateStyle = .full
        retval.timeStyle = .full
        return retval
    }()
}
