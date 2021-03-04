//
//  NetworkManager.swift
//  AlteraTest
//
//  Created by Альберт on 03.03.2021.
//

import Foundation
import Alamofire

let urlString = "https://newsapi.org/v2/top-headlines?country=ru&apiKey=19fdc9a219ef4c32a7433b8560ef2960"

class NetworkManager {
    
    func loadArticles(responseHandler: @escaping ([Articles]?) -> Void) {
        AF.request(urlString).responseJSON { (response) in
            guard let data = response.data else {
                responseHandler(nil)
                return
            }
            let articles = self.parseJSON(withData: data)
            responseHandler(articles)
        }
    }
    
//    добавить замыкание
    private func parseJSON(withData data: Data) -> [Articles]? {
        do {
            let articlesData = try JSONDecoder().decode(ArticlesResponse.self, from: data)
            return articlesData.articles
            
        } catch let error as NSError {
            print(error.localizedDescription)
            //            MARK: add error handler
            return nil
        }
    }
}
