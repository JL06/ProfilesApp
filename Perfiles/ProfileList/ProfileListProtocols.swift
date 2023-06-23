//
//  ProfileListProtocols.swift
//  Perfiles
//
//  Created Juan Luis Hernández López on 23/06/23.
//

import UIKit

//MARK: Router -
protocol ProfileListRouterProtocol: AnyObject {
    
}
//MARK: Presenter -
protocol ProfileListPresenterProtocol: AnyObject {
    func obtainUsers()
    func manageUsers(_ users: [UserApi])
}

//MARK: Interactor -
protocol ProfileListInteractorProtocol: AnyObject {
    var presenter: ProfileListPresenterProtocol?  { get set }
    func fetchUsers()
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void)
}

//MARK: View -
protocol ProfileListViewProtocol: AnyObject {
    var presenter: ProfileListPresenterProtocol?  { get set }
    func addUsers(_ users: [ProfileUser])
}
