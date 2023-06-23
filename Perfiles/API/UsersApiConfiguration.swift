//
//  UsersApiConfiguration.swift
//  Perfiles
//
//  Created by Juan Luis Hernández López on 23/06/23.
//

import Foundation

struct UsersApiConfiguration {
    let basePath = "https://randomuser.me/api/?seed=smartstc"
    let multiple = "results="
    let nationality = "nat=es"
    let pagination = "page="
    
    func paginateUsers(page: String, results: String) -> String {
        "\(self.basePath)&\(self.pagination)\(page)&\(self.multiple)\(results)&\(self.nationality)"
    }
    
    func getUser() -> String {
        "\(self.basePath)&\(self.nationality)"
    }
}
