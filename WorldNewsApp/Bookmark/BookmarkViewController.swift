//
//  BookmarkViewController.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 23.10.2024.
//

import UIKit

class BookmarkViewController: UIViewController {

    //MARK: - Properties
    let bookmarkView = BookmarkView()
    
    var articlesArray = [Article]() {
            didSet {
                bookmarkView.reloadCollectionView()
            }
        }

    //MARK: - Life cycle
    override func loadView() {
            view = bookmarkView
            bookmarkView.collectionView.dataSource = self
            bookmarkView.collectionView.delegate = self
            bookmarkView.collectionView.register(BookmarkCell.self, forCellWithReuseIdentifier: "cell")
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
}

// MARK: - UICollectionView DataSource & Delegate
extension BookmarkViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articlesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookmarkCell
        cell.configure(with: articlesArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.frame.width
        return CGSize(width: itemWidth, height: 96)
    }
}
