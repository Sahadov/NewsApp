//
//  SelectGameViewController.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 25.10.2024.
//

import UIKit

class SelectGameViewController: UIViewController {
    
    //MARK: - Properties
    let selectGameView = SelectGameView()


    //MARK: - Life cycle
    override func loadView() {
        view = selectGameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }

    //MARK: - Methods
    
    private func setupButtons() {
        selectGameView.singlePlayerButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        selectGameView.twoPlayersButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        selectGameView.leaderboardButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
    }
    

    
    @objc private func buttonsTapped(sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        
        let destinationVC: UIViewController
        
        switch title {
        case "Single Player":
            destinationVC = HomeViewController()
        case "Two Players":
            destinationVC = BookmarkViewController()
        case "Leaderboard":
            destinationVC = HomeViewController()
        default:
            destinationVC = UIViewController()
        }
        
        print("done")
        navigationController?.pushViewController(destinationVC, animated: true)
    }

}



