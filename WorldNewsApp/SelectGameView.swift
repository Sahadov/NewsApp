//
//  SelectGameView.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 25.10.2024.
//
import UIKit

extension UIView {
    //Base ContainerView with shadow
    static func makeContainerView(backgroundColor: UIColor = .white) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.backgroundColor = .white
        
        view.layer.shadowColor = UIColor(red: 0.604, green: 0.624, blue: 0.765, alpha: 0.35).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowRadius = 30
        view.layer.masksToBounds = false

        return view
    }
}

extension UIButton {
    
    enum ButtonColor {
            case blue
            case gray
            case white
        }
    
    static func makeCustomButton(with title: String, color: ButtonColor) -> UIButton
    {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        
        switch color {
            case .blue:
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = UIColor(named: "blue")
            case .gray:
                button.setTitleColor(.black, for: .normal)
                button.backgroundColor = UIColor(named: "blue")
            case .white:
                button.setTitleColor(UIColor(named: "blue"), for: .normal)
                button.backgroundColor = .white
                button.layer.borderWidth = 2
                button.layer.borderColor = UIColor(named: "blue")?.cgColor
                            
        }
        return button
    }
}

class SelectGameView: UIView {
    
    //MARK: - Properties
    private let containerView = UIView.makeContainerView()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.text = "Select Game"
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return title
    }()
    
    let singlePlayerButton: UIButton = {
        let button = UIButton.makeCustomButton(with: "Single Player", color: .gray)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let twoPlayersButton: UIButton = {
        let button = UIButton.makeCustomButton(with: "Two Players", color: .gray)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let leaderboardButton: UIButton = {
        let button = UIButton.makeCustomButton(with: "Leaderboard", color: .gray)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    private func setupViews() {
        backgroundColor = UIColor(red: 245 / 255, green: 247 / 255, blue: 255 / 255, alpha: 1)
        
        addSubview(containerView)
        
        [titleLabel, singlePlayerButton, twoPlayersButton, leaderboardButton].forEach { containerView.addSubview($0) }
    }
    
    
}

private extension SelectGameView {
    func setConstraints() {
        let paddingContainerView: CGFloat = 20
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 285),
            containerView.heightAnchor.constraint(equalToConstant: 336),
            
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddingContainerView),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddingContainerView),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: paddingContainerView),
            
            singlePlayerButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddingContainerView),
            singlePlayerButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddingContainerView),
            singlePlayerButton.heightAnchor.constraint(equalToConstant: 69),
            
            twoPlayersButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddingContainerView),
            twoPlayersButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddingContainerView),
            twoPlayersButton.topAnchor.constraint(equalTo: singlePlayerButton.bottomAnchor, constant: paddingContainerView),
            twoPlayersButton.heightAnchor.constraint(equalToConstant: 69),
            
            leaderboardButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddingContainerView),
            leaderboardButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddingContainerView),
            leaderboardButton.topAnchor.constraint(equalTo: twoPlayersButton.bottomAnchor, constant: paddingContainerView),
            leaderboardButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -paddingContainerView),
            leaderboardButton.heightAnchor.constraint(equalToConstant: 69)
        ])
    }
}
