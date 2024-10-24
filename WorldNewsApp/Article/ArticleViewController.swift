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
}


