//
//  ArticlesViewModel.swift
//  AlteraTest
//
//  Created by Альберт on 02.03.2021.
//

import Foundation

class ViewModel: ArticlesViewModelType {
    
    private var selectedIndexPath: IndexPath?
    var networkManager: NetworkManager!
    
    var articles:[Articles]?
    
    func loadData(completion: @escaping() -> ()) {
        NetworkManager().loadArticles(responseHandler: { [weak self] (articles) in
            guard let strongSelf = self else { return }
            strongSelf.articles = articles
            DispatchQueue.main.async {
                completion()
            }
        })
    }
    
    func numberOfRows() -> Int {
        return articles?.count ?? 0
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> ArticlesCellViewModelType? {
        guard let articles = self.articles else {
            return nil
        }
        let article = articles[indexPath.row]
        return ArticlesCellViewModel(article: article)
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let articles = self.articles,
              let selectedIndexPath =  selectedIndexPath else {
            return nil
        }
        return DetailViewModel(article: articles[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}
