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
    let storageManager = StorageManager()
    var articlesArray = [Article]()

    //MARK: - Life cycle
    override func loadView() {
        view = bookmarkView
        bookmarkView.collectionView.dataSource = self
        bookmarkView.collectionView.delegate = self
        bookmarkView.collectionView.register(BookmarkCell.self, forCellWithReuseIdentifier: "cell")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }

    //MARK: - Methods
    private func loadData() {
        articlesArray = storageManager.getFavouriteArticles(forKey: .favouriteArticles)
        bookmarkView.collectionView.reloadData()
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = articlesArray[indexPath.row]
        let articleViewController = ArticleViewController(with: article)
        articleViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(articleViewController, animated: true)
    }
}
