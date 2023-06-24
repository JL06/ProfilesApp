//
//  LoginPresenter.swift
//  Perfiles
//
//  Created Juan Luis Hernández López on 23/06/23.

import UIKit

class LoginPresenter: LoginPresenterProtocol {
    weak private var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol?
    private let router: LoginRouterProtocol
    
    var currentUser: LoginUser!

    init(interface: LoginViewProtocol, interactor: LoginInteractorProtocol?, router: LoginRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func start() {
        self.interactor?.obtainUser()
    }
    
    func manageUser(_ user: UserApi) {
        self.currentUser = LoginUser(user: user)
    }
    
    func loginAttempt(email: String?, password: String?) {
        self.router.goToProfileListing()
        return
        let validator = Validator()
        do {
            try validator.validate(email, type: .email)
            try validator.validate(password, type: .password)
        } catch let error as ErrorMessageProviding {
            self.view?.showError(error.errorMessage)
            return
        } catch {
            self.view?.showError(LocalizedErrorDescription.defaultError())
            return
        }
        
        if let validEmail = email, let validPassword = password {
            if validEmail == self.currentUser.email && validPassword.calculateSHA256Hash() == self.currentUser.password {
                self.router.goToProfileListing()
            } else {
                self.view?.showError(LocalizedErrorDescription(titleKey: "GenericError", descriptionKey: "LoginIncorrect"))
            }
        }
    }
}
