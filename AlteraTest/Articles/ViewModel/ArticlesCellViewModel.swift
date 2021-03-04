//
//  ArticlesCellViewModel.swift
//  AlteraTest
//
//  Created by Альберт on 02.03.2021.
//

import Foundation

class ArticlesCellViewModel: ArticlesCellViewModelType {
    
    private var article: Articles
    
    var author: String {
        return article.author ?? ""
    }
    
    var label: String {
        return article.title ?? ""
    }
    
    var image: String {
        return article.urlToImage ?? ""
    }
    
    init(article: Articles) {
        self.article = article
    }
    
}
