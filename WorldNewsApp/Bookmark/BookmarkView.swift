//
//  BookmarkView.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 23.10.2024.
//

import UIKit

class BookmarkView: UIView {

    //MARK: - Properties

    var collectionView: UICollectionView!

    let noBookmarksLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.numberOfLines = 0
        title.tintColor = .systemGray6
        //title.text = "You haven't saved any articles yet. Start reading and bookmarking them now."
        title.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return title
    }()


    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setCollectionView()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setup UI
    private func setupViews() {
        backgroundColor = .white
    }
        
    func reloadCollectionView() {
        collectionView.reloadData()
    }

}


private extension BookmarkView {
    func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        addSubview(noBookmarksLabel)
    }
}

private extension BookmarkView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            //noBookmarksLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            //noBookmarksLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            //noBookmarksLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
    }
}

