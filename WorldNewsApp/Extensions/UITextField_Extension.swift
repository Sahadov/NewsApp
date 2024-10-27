//
//  UITextField_Extension.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 26.10.2024.
//


import UIKit

extension UITextField {

    static func makeTextField() -> UITextField {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }
    
    static func makeCustomTextfield(placeholderText: String?, iconName: String, isSecure: Bool, keyboardType: UIKeyboardType) -> UITextField {
        let element = UITextField()
        element.keyboardType = keyboardType
        
        let paddingView = UIView(frame: CGRectMake(0, 0, 20, 20))
        element.leftView = paddingView
        element.leftViewMode = .always

        element.placeholder = placeholderText
        element.backgroundColor = UIColor.lightGray
        element.textAlignment = .left
        element.layer.cornerRadius = 15
        element.font = .systemFont(ofSize: 18)
        element.textColor = UIColor.gray
        element.tintColor = UIColor.black
        //element.layer.borderColor = UIColor.gray.cgColor
        //element.layer.borderWidth = 3.0
    
        element.translatesAutoresizingMaskIntoConstraints = false
        
        if (isSecure) {
            element.isSecureTextEntry = true
            element.setSecureInputButton()
        }
        
        
        // Create the icon image view
        let icon = UIImageView(image: UIImage(systemName: iconName))
        icon.tintColor = UIColor.gray
        icon.contentMode = .scaleAspectFit

        // Set the icon view frame (adjust size as needed)
        icon.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

        // Set padding around the icon (use a UIView wrapper)
        let padding: CGFloat = 15
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: icon.frame.width + padding * 2, height: icon.frame.height))
        icon.center = CGPoint(x: iconContainerView.frame.width / 2, y: iconContainerView.frame.height / 2) // Center the icon within the container
        iconContainerView.addSubview(icon)

        // Assign the icon container to the left or right view
        element.leftView = iconContainerView // For left icon
        element.leftViewMode = .always // Always show the icon
        
        return element
    }
        
    func setSecureInputButton() {
        let button = UIButton(type: .custom)
        let showPass = UIImage(systemName: "eye")
        let hidePass = UIImage(systemName: "eye.slash")
        let action = UIAction { [weak self] action in
            self?.isSecureTextEntry.toggle()
            let image = self?.isSecureTextEntry ?? true ? showPass : hidePass
            button.setImage(image, for: .normal)
        }
        button.frame = CGRect(x: 16, y: 10, width: 20, height: 20)
        button.setImage(showPass, for: .normal)
        button.addAction(action, for: .touchUpInside)
        button.sizeToFit()
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
        containerView.addSubview(button)
        rightView = containerView
        rightViewMode = .always
    }


}
