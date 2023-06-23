//
//  ProfileListInteractor.swift
//  Perfiles
//
//  Created Juan Luis Hernández López on 23/06/23.

import UIKit

class ProfileListInteractor: ProfileListInteractorProtocol {
    weak var presenter: ProfileListPresenterProtocol?
    let configuration = UsersApiConfiguration()
    private var currentPage: Int = 0
    private let defaultUsersPerPage = 10
    private let imageCache = NSCache<NSURL, UIImage>()
    
    func fetchUsers() {
        self.currentPage += 1
        if let url = URL(string: self.configuration.paginateUsers(page: self.currentPage.description, results: self.defaultUsersPerPage.description)) {
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
                            self.presenter?.manageUsers(userApi.results)
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
    
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = imageCache.object(forKey: url as NSURL) {
            completion(cachedImage)
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            if let data = data, let image = UIImage(data: data) {
                // Cache the downloaded image
                self?.imageCache.setObject(image, forKey: url as NSURL)
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
