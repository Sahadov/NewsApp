//
//  TabBarController.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 23.10.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupNav()
    }
}

private extension TabBarController {
    
    func setupTabs() {
        let home = self.createNav(with: "Browse", image: UIImage(systemName: "house"), vc: BookmarkViewController())
        let categories = self.createNav(with: "Categories", image: UIImage(systemName: "square.grid.2x2"), vc: CategoriesViewController())
        let bookmarks = self.createNav(with: "Bookmarks", image: UIImage(systemName: "bookmark"), vc: BookmarkViewController())
        let profile = self.createNav(with: "Profile", image: UIImage(systemName: "person"), vc: CategoriesViewController())
        self.setViewControllers([home, categories, bookmarks, profile], animated: true)
    }
    
    func setupNav() {
        self.tabBar.tintColor = .blue
        self.tabBar.backgroundColor = .white
        
    }
    
    func createNav(with title: String, image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title
        return nav
    }
}

