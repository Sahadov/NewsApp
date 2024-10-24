//
//  SceneDelegate.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 21.10.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = BookmarkViewController()
        window?.makeKeyAndVisible()
    }
}
