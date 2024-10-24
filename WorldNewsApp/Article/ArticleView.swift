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
        image.layer.cornerRadius = 15
        return image
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
        backgroundColor = .red
        addSubview(imageView)
        imageView.addSubview(titleLabel)
    }
    
    func configure(with article: Article) {
        titleLabel.text = article.title
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
        ])
    }
}
