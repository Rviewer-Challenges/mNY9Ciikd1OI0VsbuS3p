//
//  HomeViewController.swift
//  FirebaseChat
//
//  Created by Esther Alcoceba Gutiérrez de León on 8/8/22.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var closeSessionButton: UIButton!
    
    private let email: String
    private let provider: ProviderType
    
    init(email: String, provider: ProviderType) {
        self.email = email
        self.provider = provider
        // llamamos a super y a init para hacer de forma correcta la instanciación de este componente
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       title = "Inicio"
        
        emailLabel.text = email
        providerLabel.text = provider.rawValue
    }
    
    @IBAction func closeSessionButtonAction(_ sender: Any) {
        switch provider {
        case .basic:
            do {
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            } catch {
                // Se ha producido un error
            }
        default:
            break
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
