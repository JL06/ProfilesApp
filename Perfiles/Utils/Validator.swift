//
//  Validator.swift
//  Perfiles
//
//  Created by Juan Luis Hernández López on 23/06/23.
//

import Foundation

protocol ErrorMessageProviding {
    var errorMessage: LocalizedErrorDescription { get }
}

struct Validator {
    enum ValidationError: Error, ErrorMessageProviding {
        case emptyField
        case invalidEmail
        case passwordShort
        
        var errorMessage: LocalizedErrorDescription {
            switch self {
            case .emptyField:
                return LocalizedErrorDescription(titleKey: "GenericError", descriptionKey: "EmptyField")
            case .invalidEmail:
                return LocalizedErrorDescription(titleKey: "GenericError", descriptionKey: "InvalidEmail")
            case .passwordShort:
                return LocalizedErrorDescription(titleKey: "GenericError", descriptionKey: "PasswordShort")
            }
        }
    }
    
    enum ValidationType {
        case password
        case email
    }
    
    func validate(_ input: String?, type: ValidationType) throws {
        guard let input = input, !input.isEmpty else {
            throw ValidationError.emptyField
        }
        
        switch type {
        case .password:
            guard input.count > 3 else {
                throw ValidationError.passwordShort
            }
        case .email:
            let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            
            guard emailPredicate.evaluate(with: input) else {
                throw ValidationError.invalidEmail
            }
        }
    }
}
