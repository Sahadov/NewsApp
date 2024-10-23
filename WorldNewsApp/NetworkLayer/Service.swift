//
//  Service.swift
//  WorldNewsApp
//
//  Created by Дмитрий Волков on 23.10.2024.
//

import Foundation


struct RequestAnswer: Codable {
    //let status: String
    //let totalResults: Int
    let articles: [Article]
}

struct Source: Codable {
    let id: String?
    let name: String?
}

struct Article: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

enum ErrorMessage: String, Error {
    case invalidData = "Sorry. Something went wrong, try again"
    case invalidResponse = "Server error. Please modify your search and try again"
}



class Service {
    static let shared = Service()
    
    func getResults(category: String, completed: @escaping (Result<RequestAnswer, ErrorMessage>) -> Void) {
        
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=\(category)&apiKey=105be9265a2b4835836cae7db850297d"
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completed(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let deconder = JSONDecoder()
                deconder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try deconder.decode(RequestAnswer.self, from: data)
                completed(.success(results))
                
                
            } catch {
                completed(.failure(.invalidData))
            }
            
            
        }
        task.resume()
        
        
        
    }
}
