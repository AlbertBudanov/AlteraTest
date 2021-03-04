//
//  DetailViewModel.swift
//  AlteraTest
//
//  Created by Альберт on 02.03.2021.
//

import Foundation

class DetailViewModel: DetailViewModelType {    
        
    private var article: Articles

    var description: String? {
        return article.description
    }
    
    var title: String? {
        return article.title
    }
    
    var image: String? {
        return article.urlToImage 
    }
    
    init(article: Articles) {
        self.article = article
    }
}
