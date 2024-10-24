//
//  StorageManager.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 23.10.2024.
//

import Foundation

protocol StorageManagerProtocol {
    func set(_ article: Article, forKey key: String)
    func getFavouriteArticles(forKey key: String) -> [Article]
    func remove(_ article: Article, forKey key: String)
}

final class StorageManager {
    public enum Keys: String {
        case favouriteArticles
    }

    private let userDefaults = UserDefaults.standard

    private func store(_ object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }

    private func restore(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
}

// MARK: - StorageManagerProtocol
extension StorageManager: StorageManagerProtocol {

    func set(_ article: Article, forKey key: String) {
        var articles = getFavouriteArticles(forKey: key) // Retrieve existing articles
        
        // Add the new article if it's not already present
        if !articles.contains(where: { $0.url == article.url }) { // Assuming `url` is unique
            articles.append(article)
                
            if let encoded = try? JSONEncoder().encode(articles) {
                userDefaults.set(encoded, forKey: key)
                print("Article succesfully added")
            }
        }
    }
    
    
    func getFavouriteArticles(forKey key: String) -> [Article] {
            if let data = userDefaults.data(forKey: key),
               let articles = try? JSONDecoder().decode([Article].self, from: data) {
                return articles
            }
            return [] // Return an empty array if nothing found
    }
    
    
    func remove(_ article: Article, forKey key: String) {
            var articles = getFavouriteArticles(forKey: key)
            
            articles.removeAll { $0.url == article.url } // Remove based on unique identifier
            
            if let encoded = try? JSONEncoder().encode(articles) {
                userDefaults.set(encoded, forKey: key)
                print("Article succesfully removed")
            }
    }
    
}

