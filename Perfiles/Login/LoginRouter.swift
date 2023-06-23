//
//  LoginRouter.swift
//  Perfiles
//
//  Created Juan Luis Hernández López on 23/06/23.

import UIKit

class LoginRouter: LoginRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = LoginViewController(nibName: nil, bundle: nil)
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func goToProfileListing() {
        if let profileListingController = ProfileListRouter.createModule() {
            profileListingController.modalPresentationStyle = .fullScreen
            self.viewController?.present(profileListingController, animated: true)
        } else {
            //TODO: Manage error
        }
        
    }
}
