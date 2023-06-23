//
//  LoginUser.swift
//  Perfiles
//
//  Created by Juan Luis Hernández López on 23/06/23.
//

import Foundation

struct LoginUser {
    let email: String
    let username: String
    let password: String
    let name: String
    
    init(user: UserApi) {
        self.email = user.email
        self.username = user.login.username
        self.password = user.login.password.calculateSHA256Hash() ?? user.login.sha256
        self.name = user.name.first + user.name.last
    }
}
