//
//  Articles.swift
//  AlteraTest
//
//  Created by Альберт on 02.03.2021.
//

import Foundation

struct ArticlesResponse: Decodable {
    var status: String
    var totalResults: Int
    var articles: [Articles]?
}

struct Articles: Decodable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?

}
