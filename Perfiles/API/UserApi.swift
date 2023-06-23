//
//  UserApi.swift
//  Perfiles
//
//  Created by Juan Luis Hernández López on 23/06/23.
//

import Foundation

struct ResultUserApi: Codable {
    let results: [UserApi]
}

struct UserApi: Codable {
    let gender: String
    let name: UserApiName
    let location: UserApiLocation
    let email: String
    let login: UserApiLogin
    let dob: UserApiDob
    let registered: UserApiRegister
    let phone: String
    let cell: String
    let id: UserApiId
    let picture: UserApiPicture
    let nat: String
}

struct UserApiName: Codable {
    let title: String
    let first: String
    let last: String
}

struct UserApiLocation: Codable {
    let street: UserApiStreet
    let city: String
    let state: String
    let country: String
    let postcode: Int
    let coordinates: UserApiCoordinates
    let timezone: UserApiTimezone
}

struct UserApiStreet: Codable {
    let number: Int
    let name: String
}

struct UserApiCoordinates: Codable {
    let latitude: String
    let longitude: String
}

struct UserApiTimezone: Codable {
    let offset: String
    let description: String
}

struct UserApiLogin: Codable {
    let uuid: String
    let username: String
    let password: String
    let salt: String
    let md5: String
    let sha1: String
    let sha256: String
}

struct UserApiDob: Codable {
    let date: String
    let age: Int
}

struct UserApiRegister: Codable {
    let date: String
    let age: Int
}

struct UserApiId: Codable {
    let name: String
    let value: String
}

struct UserApiPicture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}
