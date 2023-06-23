//
//  ProfileListPresenter.swift
//  Perfiles
//
//  Created Juan Luis Hernández López on 23/06/23.

import UIKit

class ProfileListPresenter: ProfileListPresenterProtocol {

    weak private var view: ProfileListViewProtocol?
    var interactor: ProfileListInteractorProtocol?
    private let router: ProfileListRouterProtocol

    init(interface: ProfileListViewProtocol, interactor: ProfileListInteractorProtocol?, router: ProfileListRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func obtainUsers() {
        self.interactor?.fetchUsers()
    }
    
    func manageUsers(_ users: [UserApi]) {
        if !users.isEmpty {
            let dispatchGroup = DispatchGroup()
            var profileUsers: [ProfileUser] = []
            
            for user in users {
                var profile = ProfileUser(user: user)
                
                if let urlImage = URL(string: profile.pictureMedium) {
                    dispatchGroup.enter()
                    
                    self.interactor?.downloadImage(from: urlImage) { image in
                        profile.imageMedium = image
                        profileUsers.append(profile)
                        dispatchGroup.leave()
                    }
                } else {
                    profileUsers.append(profile)
                }
            }
            
            dispatchGroup.notify(queue: .main) {
                self.view?.addUsers(profileUsers)
            }
        } else {
            // TODO: no more users
        }
    }

}
