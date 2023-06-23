//
//  ProfileListRouter.swift
//  Perfiles
//
//  Created Juan Luis Hernández López on 23/06/23.

import UIKit

class ProfileListRouter: ProfileListRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController? {
        let storyboard = UIStoryboard(name: "ProfileList", bundle: nil)
        if let view = storyboard.instantiateViewController(withIdentifier: "ProfileListViewController") as? ProfileListViewController {
            let interactor = ProfileListInteractor()
            let router = ProfileListRouter()
            let presenter = ProfileListPresenter(interface: view, interactor: interactor, router: router)
            
            view.presenter = presenter
            interactor.presenter = presenter
            router.viewController = view
            
            return view
        }
        return nil
    }
    
    
}
