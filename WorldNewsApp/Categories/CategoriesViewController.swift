//
//  CategoriesViewController.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 23.10.2024.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    //MARK: - Properties
    let categoriesView = CategoriesView()

    //MARK: - Life cycle
    override func loadView() {
        view = categoriesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - Methods

}
