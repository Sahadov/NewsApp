//
//  AuthViewController.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 26.10.2024.
//

import UIKit

class AuthViewController: UIViewController {

    //MARK: - Properties
    let authView = AuthView()
    let storageManager = StorageManager()
    

    //MARK: - Life cycle
    override func loadView() {
            view = authView
    }
        
    override func viewDidLoad() {
            super.viewDidLoad()
        
    }

    //MARK: - Methods
    
    
}

