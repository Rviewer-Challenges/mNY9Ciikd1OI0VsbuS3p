//
//  AuthViewController.swift
//  FirebaseChat
//
//  Created by Esther Alcoceba Gutiérrez de León on 6/8/22.
//

import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var singUpButton: UIButton!
    @IBOutlet weak var longInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Damos nombre a la barra de navegación
        title = "Autenticación"
    }

    @IBAction func singUpButtonAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                
                if let result = result, error == nil {
                    
                    self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                } else {
                    let alertOnFailController = UIAlertController(title: "Error", message: "Se ha producido un error de registro de usuario", preferredStyle: .alert)
                    alertOnFailController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertOnFailController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func logInButtonAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if let result = result, error == nil {
                    
                    self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                } else {
                    let alertOnFailController = UIAlertController(title: "Error", message: "Usuario no registrado", preferredStyle: .alert)
                    alertOnFailController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertOnFailController, animated: true, completion: nil)
                }
            }
        }
    }
    
}

