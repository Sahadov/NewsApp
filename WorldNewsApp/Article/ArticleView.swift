//
//  ArticleView.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 24.10.2024.
//

import UIKit

class ArticleView: UIView {
    
    //MARK: - Properties
    let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.textAlignment = .left
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return title
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "article")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    let bookmarkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFill
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.isUserInteractionEnabled = true
        button.tintColor = .white
        return button
    }()
    
    let shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFill
        button.tintColor = .white
        button.isUserInteractionEnabled = true
        button.setImage(UIImage(systemName: "arrowshape.turn.up.forward"), for: .normal)
        return button
    }()
    
    let authorLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.textAlignment = .left
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return title
    }()
    
    let descriptionLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.textAlignment = .left
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return title
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
        backgroundColor = .white
        addSubview(imageView)
        addSubview(descriptionLabel)
        imageView.addSubview(titleLabel)
        imageView.addSubview(authorLabel)
        imageView.addSubview(bookmarkButton)
        imageView.addSubview(shareButton)
    }
    
    func configure(with article: Article) {
        titleLabel.text = article.title
        descriptionLabel.text = article.description
        authorLabel.text = article.author
    }
        

}

private extension ArticleView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 70),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -15),
            authorLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 15),
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            bookmarkButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -15),
            bookmarkButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 60),
            shareButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -15),
            shareButton.topAnchor.constraint(equalTo: bookmarkButton.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30)
            
        ])
    }
}
