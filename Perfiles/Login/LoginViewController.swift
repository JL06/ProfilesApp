//
//  LoginViewController.swift
//  Perfiles
//
//  Created Juan Luis Hernández López on 23/06/23.

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {
	var presenter: LoginPresenterProtocol?

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.start()
    }
    
    @IBAction func tapLoginButton(_ sender: UIButton) {
        self.presenter?.loginAttempt(email: self.emailTextField.text, password: self.passwordTextField.text)
    }
    
    func showError(_ error: LocalizedErrorDescription) {
        let alertController = UIAlertController(title: error.title, message: error.description, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("accept-button", comment: ""), style: .default, handler: nil)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true)
    }
}
