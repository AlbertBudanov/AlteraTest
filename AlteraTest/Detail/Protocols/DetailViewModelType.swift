//
//  DetailViewModelType.swift
//  AlteraTest
//
//  Created by Альберт on 02.03.2021.
//

import Foundation

protocol DetailViewModelType: class {
    var image: String? { get }
    var title: String? { get }
    var description: String? { get }
}
