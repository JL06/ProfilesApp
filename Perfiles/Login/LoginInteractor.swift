//
//  LoginInteractor.swift
//  Perfiles
//
//  Created Juan Luis Hernández López on 23/06/23.

import UIKit

class LoginInteractor: LoginInteractorProtocol {

    weak var presenter: LoginPresenterProtocol?
    let configuration = UsersApiConfiguration()
    
    func obtainUser() {
        if let url = URL(string: self.configuration.getUser()) {
            let task = URLSession.shared.dataTask(with: url) { resultData, response, error in
                if let error = error {
                    print(error)
                    // TODO: Comm service error
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Invalid response")
                    // TODO: handle invalid response
                    return
                }
                
                let statusCode = httpResponse.statusCode
                if statusCode == 200 {
                    if let resultData = resultData {
                        do {
                            let userApi = try JSONDecoder().decode(ResultUserApi.self, from: resultData)
                            if let user = userApi.results.first {
                                self.presenter?.manageUser(user)
                            } else {
                                // TODO: Manage no user return
                            }
                            
                        } catch {
                            print("Error parsing JSON: \(error.localizedDescription)")
                        }
                    }
                } else {
                    print("Error: \(statusCode)")
                    //TODO: handle error
                }
            }
            task.resume()
        } else {
            //TODO: Internal error
        }
    }
    
}
