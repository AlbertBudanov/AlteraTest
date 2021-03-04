//
//  ArticlesViewModelType.swift
//  AlteraTest
//
//  Created by Альберт on 02.03.2021.
//

import Foundation

protocol ArticlesViewModelType {
    
    func numberOfRows() -> Int
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> ArticlesCellViewModelType?
    
    func viewModelForSelectedRow() -> DetailViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
    func loadData(completion: @escaping() -> ())
    
    
}
