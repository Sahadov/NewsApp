//
//  ArticleViewController.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 24.10.2024.
//

import UIKit

class ArticleViewController: UIViewController {

    //MARK: - Properties
    let articleView = ArticleView()
    var article: Article?
    let storageManager = StorageManager()
    
    init(with article: Article?) {
        super.init(nibName: nil, bundle: nil)
        self.article = article
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func loadView() {
        view = articleView
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackNavButton()
        guard let article = article else { return }
        articleView.configure(with: article)
        
        if isArticleFavourite(with: article) { setFavouriteArticle() }
        
        articleView.bookmarkButton.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        
        
        
    }

    //MARK: - Methods
}

private extension ArticleViewController {
    func setBackNavButton(){
        let backButtonImage = UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysTemplate)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backIndicatorImage = backButtonImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
    }
    func isArticleFavourite(with article: Article) -> Bool {
        let articles = storageManager.getFavouriteArticles(forKey: "favouriteArticles")
        if articles.contains(where: { $0.url == article.url }){ return true }
        return false
    }
    func setFavouriteArticle(){
        articleView.bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
    }
    func setUnfavouriteArticle(){
        articleView.bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
    }
    
    @objc func bookmarkButtonTapped() {
        print("pressed")
//        guard let article = self.article else {return}
//        if isArticleFavourite(with: article) {
//            setUnfavouriteArticle()
//            storageManager.remove(article, forKey: "favouriteArticles")
//        } else {
//            setFavouriteArticle()
//            storageManager.set(article, forKey: "favouriteArticles")
//        }
    }
}


