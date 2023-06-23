//
//  LoginProtocols.swift
//  Perfiles
//
//  Created Juan Luis Hernández López on 23/06/23.
//

import Foundation

//MARK: Router -
protocol LoginRouterProtocol: AnyObject {
    func goToProfileListing()
}
//MARK: Presenter -
protocol LoginPresenterProtocol: AnyObject {
    func start()
    func manageUser(_ user: UserApi)
    func loginAttempt(email: String?, password: String?)
}

//MARK: Interactor -
protocol LoginInteractorProtocol: AnyObject {
    var presenter: LoginPresenterProtocol?  { get set }
    func obtainUser()
}

//MARK: View -
protocol LoginViewProtocol: AnyObject {
    var presenter: LoginPresenterProtocol?  { get set }
    func showError(_ error: LocalizedErrorDescription)
}
