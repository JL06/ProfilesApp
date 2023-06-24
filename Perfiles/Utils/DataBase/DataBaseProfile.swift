//
//  DataBaseProfile.swift
//  Perfiles
//
//  Created by Juan Luis Hernández López on 24/06/23.
//

import Foundation
import FirebaseDatabase

class DataBaseProfile {
    var reference: DatabaseReference = Database.database().reference()
    
    func addNewBatteryValue(date: String, value: Float) {
        let batteryInfo = BatteryDetail(timestamp: date, level: value)
        do {
            let data = try JSONEncoder().encode(batteryInfo)
            let dictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            if let dictionary = dictionary {
                self.saveToDatabase(dictionary: dictionary)
            }
        } catch {
            print("There was an error encoding JSON: \(error.localizedDescription)")
        }
    }
    
    private func saveToDatabase(dictionary: [String: Any]) {
        self.reference.child("battery").childByAutoId().setValue(dictionary) { error, refe in
            if let error = error {
                print("Failed to save data: \(error.localizedDescription)")
            } else {
                print("Data saved successfully!")
            }
        }
    }
}
