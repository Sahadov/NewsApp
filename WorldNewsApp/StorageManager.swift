//
//  StorageManager.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 23.10.2024.
//

import Foundation

protocol StorageManagerProtocol {
    func addArticleToFavourites(_ article: Article, forKey key: StorageManager.Keys)
    func getFavouriteArticles(forKey key: StorageManager.Keys) -> [Article]
    func removeArticleFromFavourites(_ article: Article, forKey key: StorageManager.Keys)
}

final class StorageManager {
    public enum Keys: String {
        case favouriteArticles
        case isLoggedIn
        case categories
    }

    private let userDefaults = UserDefaults.standard
    
    // Helperes methods
    private func encode<T: Encodable>(_ object: T) -> Data? {
        return try? JSONEncoder().encode(object)
    }

    private func decode<T: Decodable>(_ type: T.Type, from data: Data) -> T? {
        return try? JSONDecoder().decode(type, from: data)
    }

    private func store<T: Encodable>(_ object: T, forKey key: Keys) {
        if let encoded = encode(object) {
            userDefaults.set(encoded, forKey: key.rawValue)
        }
    }

    private func restore<T: Decodable>(forKey key: Keys, as type: T.Type) -> T? {
        guard let data = userDefaults.data(forKey: key.rawValue) else { return nil }
        return decode(type, from: data)
    }
}

// MARK: - StorageManagerProtocol
extension StorageManager: StorageManagerProtocol {
    
    func addArticleToFavourites(_ article: Article, forKey key: Keys) {
        var articles = getFavouriteArticles(forKey: key)
        
        if !articles.contains(where: { $0.url == article.url }) {
            articles.append(article)
            store(articles, forKey: key)
            print("Article successfully added")
        }
    }

    func getFavouriteArticles(forKey key: Keys) -> [Article] {
        return restore(forKey: key, as: [Article].self) ?? []
    }

    func removeArticleFromFavourites(_ article: Article, forKey key: Keys) {
        var articles = getFavouriteArticles(forKey: key)
        articles.removeAll { $0.url == article.url }
        store(articles, forKey: key)
    }
}

//protocol StorageManagerProtocol {
//    func set(_ article: Article, forKey key: String)
//    func getFavouriteArticles(forKey key: String) -> [Article]
//    func remove(_ article: Article, forKey key: String)
//}
//
//final class StorageManager {
//    public enum Keys: String {
//        case favouriteArticles
//        case isLogedIn
//        case categories
//    }
//
//    private let userDefaults = UserDefaults.standard
//
//    private func store(_ object: Any?, key: String) {
//        userDefaults.set(object, forKey: key)
//    }
//
//    private func restore(forKey key: String) -> Any? {
//        userDefaults.object(forKey: key)
//    }
//
//}
//
//// MARK: - StorageManagerProtocol
//extension StorageManager: StorageManagerProtocol {
//
//    func set(_ article: Article, forKey key: String) {
//        var articles = getFavouriteArticles(forKey: key) // Retrieve existing articles
//
//        // Add the new article if it's not already present
//        if !articles.contains(where: { $0.url == article.url }) { // Assuming `url` is unique
//            articles.append(article)
//
//            if let encoded = try? JSONEncoder().encode(articles) {
//                userDefaults.set(encoded, forKey: key)
//                print("Article succesfully added")
//            }
//        }
//    }
//
//
//    func getFavouriteArticles(forKey key: String) -> [Article] {
//            if let data = userDefaults.data(forKey: key),
//               let articles = try? JSONDecoder().decode([Article].self, from: data) {
//                return articles
//            }
//            return [] // Return an empty array if nothing found
//    }
//
//
//    func remove(_ article: Article, forKey key: String) {
//            var articles = getFavouriteArticles(forKey: key)
//
//            articles.removeAll { $0.url == article.url } // Remove based on unique identifier
//
//            if let encoded = try? JSONEncoder().encode(articles) {
//                userDefaults.set(encoded, forKey: key)
//            }
//    }
//
//
//}

