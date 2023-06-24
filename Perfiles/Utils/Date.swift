//
//  Date.swift
//  Perfiles
//
//  Created by Juan Luis Hernández López on 24/06/23.
//

import Foundation

extension Date {
    func toStringISO() -> String {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.string(from: self)
    }
}
