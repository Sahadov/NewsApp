//
//  StorageManager.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 23.10.2024.
//

import Foundation

//protocol StorageManagerProtocol {
//    func set(_ object: Any?, forKey key: StorageManager.Keys)
//    func getInt(forKey key: StorageManager.Keys) -> Int?
//    func getString(forKey key: StorageManager.Keys) -> String?
//    func getArray(forKey key: StorageManager.Keys) -> [Int]?
//    func getBool(forKey key: StorageManager.Keys) -> Bool?
//    func getFavouriteArticles(forKey key: StorageManager.Keys) -> [Article]?
//}

protocol StorageManagerProtocol {
    func set(_ article: Article, forKey key: String)
    func getArticles(forKey key: String) -> [Article]
    func remove(_ article: Article, forKey key: String)
}

final class StorageManager {
    public enum Keys: String {
//        case gameTimeSwitch
//        case duration
//        case selectedCellIndex
//        case crossImageName
//        case noughtImageName
//        case leaderboard
//        case musicOn
//        case gameMode
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
//    func set(_ object: Any?, forKey key: Keys) {
//        if key == .favouriteArticles {
//            guard let articleValue = object as? Article else {
//                print("Error: Object is not an article and cannot be added to the array of favourite articles.\(String(describing: object))")
//                return
//            }
//            var array = getFavouriteArticles(forKey: key) ?? []
//            array.append(articleValue)
//
//            store(array, key: key.rawValue)
//            print("The article added to favourites")
//        } else {
//            store(object, key: key.rawValue)
//        }
//    }
    

    func set(_ article: Article, forKey key: String) {
        var articles = getArticles(forKey: key) // Retrieve existing articles
            
        // Add the new article if it's not already present
        if !articles.contains(where: { $0.url == article.url }) { // Assuming `url` is unique
            articles.append(article)
                
            if let encoded = try? JSONEncoder().encode(articles) {
                userDefaults.set(encoded, forKey: key)
                print("Succesful")
            }
        }
    }
    
    func getArticles(forKey key: String) -> [Article] {
            if let data = userDefaults.data(forKey: key),
               let articles = try? JSONDecoder().decode([Article].self, from: data) {
                return articles
            }
            return [] // Return an empty array if nothing found
    }
    
    func remove(_ article: Article, forKey key: String) {
            var articles = getArticles(forKey: key)
            
            articles.removeAll { $0.url == article.url } // Remove based on unique identifier
            
            if let encoded = try? JSONEncoder().encode(articles) {
                userDefaults.set(encoded, forKey: key)
            }
    }
    
//    func getInt(forKey key: Keys) -> Int? {
//        restore(forKey: key.rawValue) as? Int
//    }
//
//    func getString(forKey key: Keys) -> String? {
//        restore(forKey: key.rawValue) as? String
//    }
//
//    func getArray(forKey key: Keys) -> [Int]? {
//        return restore(forKey: key.rawValue) as? [Int]
//    }
//
//    func getSelectedCellIndex(forKey key: Keys) -> Int? {
//        return restore(forKey: key.rawValue) as? Int
//    }
//
//    func getBool(forKey key: Keys) -> Bool? {
//        restore(forKey: key.rawValue) as? Bool
//    }
//
//    func remove(forKey key: Keys) {
//        userDefaults.removeObject(forKey: key.rawValue)
//    }
//    func getFavouriteArticles(forKey key: Keys) -> [Article]? {
//        return restore(forKey: key.rawValue) as? [Article]
//    }
}

