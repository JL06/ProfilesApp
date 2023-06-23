//
//  ProfileListViewController.swift
//  Perfiles
//
//  Created Juan Luis Hernández López on 23/06/23.

import UIKit

class ProfileListViewController: UIViewController, ProfileListViewProtocol {
    var presenter: ProfileListPresenterProtocol?
    private var currentUsers: [ProfileUser] = []
    
    @IBOutlet weak var profileListTable: UITableView!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.obtainUsers()
        self.configureCell()
    }
    
    @IBAction func tapExitButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func addUsers(_ users: [ProfileUser]) {
        self.currentUsers += users
        self.reloadTable()
    }
    
    private func reloadTable() {
        DispatchQueue.main.async {
            self.profileListTable.reloadData()
        }
    }
    
    private func configureCell() {
        let nib = UINib(nibName: "ProfileCell", bundle: nil)
        self.profileListTable.register(nib, forCellReuseIdentifier: "ProfileCell")
    }
}

extension ProfileListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.currentUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as? ProfileCell else {
            return UITableViewCell()
        }
        cell.loadUser(self.currentUsers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
}

extension ProfileListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profile = self.currentUsers[indexPath.row]
        print(profile.fullName)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastRowIndex = tableView.numberOfRows(inSection: 0) - 1
        if indexPath.row == lastRowIndex {
            self.presenter?.obtainUsers()
        }
    }
}
