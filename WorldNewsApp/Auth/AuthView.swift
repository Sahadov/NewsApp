//
//  AuthView.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 26.10.2024.
//

import UIKit

class AuthView: UIView {

    //MARK: - Properties
    let usernameTextField = UITextField.makeCustomTextfield(placeholderText: "Username", iconName: "person", isSecure: false, keyboardType: .default)



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
        backgroundColor = .white
        addSubview(usernameTextField)
    }
        
}

private extension AuthView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


