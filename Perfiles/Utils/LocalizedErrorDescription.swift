//
//  LocalizedErrorDescription.swift
//  Perfiles
//
//  Created by Juan Luis Hernández López on 23/06/23.
//

import Foundation

struct LocalizedErrorDescription {
    let title: String
    let description: String
    
    init(titleKey: String, descriptionKey: String) {
        self.title = NSLocalizedString(titleKey, tableName: "Errors", comment: "")
        self.description = NSLocalizedString(descriptionKey, tableName: "Errors", comment: "")
    }
    
    static func defaultError() -> LocalizedErrorDescription {
        LocalizedErrorDescription(titleKey: "GenericError", descriptionKey: "UnknownError")
    }
}
