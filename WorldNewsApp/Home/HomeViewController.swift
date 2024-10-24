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
        if sender.currentImage == UIImage(systemName: "heart.fill") {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
    
}

// MARK: - UICollectionView DataSource & Delegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articlesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCell
        cell.configure(with: articlesArray[indexPath.row])
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped(_:)), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.frame.width
        return CGSize(width: itemWidth, height: 96)
    }
}
