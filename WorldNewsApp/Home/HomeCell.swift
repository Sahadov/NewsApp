//
//  BookmarkCell.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 23.10.2024.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    var article: Article?
    
    let categoryLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.tintColor = .systemGray6
        title.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return title
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.tintColor = .black
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return title
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    let likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFill
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setCell()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(){
        addSubview(titleLabel)
        [categoryLabel, titleLabel, imageView, likeButton].forEach { addSubview($0) }
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 97),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            categoryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            categoryLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            likeButton.topAnchor.constraint(equalTo: self.topAnchor),
            likeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            likeButton.widthAnchor.constraint(equalToConstant: 20),
            likeButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    // Configure Method
    func configure(with article: Article) {
        self.article = article
        titleLabel.text = article.title
        categoryLabel.text = article.author
        imageView.image = UIImage(named: "article")
    }
}


