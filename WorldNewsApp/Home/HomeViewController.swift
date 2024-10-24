//
//  BookmarkViewController.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 23.10.2024.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Properties
    let homeView = HomeView()
    let storageManager = StorageManager()
    
    var articlesArray = [Article]() {
            didSet {
                homeView.reloadCollectionView()
            }
        }

    //MARK: - Life cycle
    override func loadView() {
            view = homeView
            homeView.collectionView.dataSource = self
            homeView.collectionView.delegate = self
            homeView.collectionView.register(HomeCell.self, forCellWithReuseIdentifier: "cell")
    }
        
    override func viewDidLoad() {
            super.viewDidLoad()
            fetchArticles()
    }

    //MARK: - Methods
    private func fetchArticles() {
        Service.shared.getResults(category: "business") { [weak self] result in
            switch result {
            case .success(let results):
                DispatchQueue.main.async {
                    self?.articlesArray = results.articles
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {

        let index = sender.tag
        let article = articlesArray[index]
        
        if sender.currentImage == UIImage(systemName: "heart.fill") {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
            storageManager.remove(article, forKey: "favouriteArticles")
        } else {
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            storageManager.set(article, forKey: "favouriteArticles")
        }
    }
    
}

// MARK: - UICollectionView DataSource & Delegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articlesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let article = articlesArray[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCell
        cell.configure(with: article)
        
        // checking if the article is already in favourites
        let articles = storageManager.getFavouriteArticles(forKey: "favouriteArticles")
        if articles.contains(where: { $0.url == article.url }) {
            cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped(_:)), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.frame.width
        return CGSize(width: itemWidth, height: 96)
    }
}
