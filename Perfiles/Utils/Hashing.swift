//
//  Hashing.swift
//  Perfiles
//
//  Created by Juan Luis Hernández López on 23/06/23.
//

import Foundation
import CryptoKit

extension String {
    func calculateSHA256Hash() -> String? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }
        
        let hash = SHA256.hash(data: data)
        let hashString = hash.compactMap { String(format: "%02x", $0) }.joined()
        return hashString
    }
}
