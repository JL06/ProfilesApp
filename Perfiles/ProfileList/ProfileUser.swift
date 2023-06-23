//
//  ProfileUser.swift
//  Perfiles
//
//  Created by Juan Luis Hernández López on 23/06/23.
//

import UIKit

struct ProfileUser {
    enum ImageSize {
        case Medium
        case Large
    }
    
    let title: String
    let fullName: String
    let email: String
    let userName: String
    let location: String
    let phoneNumber: String
    let age: Int
    let nationality: String
    let pictureMedium: String
    let pictureLarge: String
    var imageMedium: UIImage?
    var imageLarge: UIImage?
    
    init(user: UserApi) {
        self.title = user.name.title
        self.fullName = user.name.first + user.name.last
        self.email = user.email
        self.userName = user.login.username
        self.location = user.location.city + ", " + user.location.country
        self.phoneNumber = user.phone
        self.age = user.dob.age
        self.nationality = user.nat
        self.pictureMedium = user.picture.medium
        self.pictureLarge = user.picture.large
    }
    
    mutating func loadImage(_ image: UIImage, size: ImageSize) {
        switch size {
        case .Medium:
            self.imageMedium = image
        case .Large:
            self.imageLarge = image
        }
    }
}
