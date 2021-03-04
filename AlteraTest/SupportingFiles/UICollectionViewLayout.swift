//
//  UICollectionViewLayout.swift
//  AlteraTest
//
//  Created by Альберт on 02.03.2021.
//

import UIKit

extension UICollectionViewLayout {
    public static var verticalFlow: UICollectionViewFlowLayout {
        let result = UICollectionViewFlowLayout()
        result.scrollDirection = .vertical

        result.minimumLineSpacing = 10
        result.minimumInteritemSpacing = 10
        return result
    }
    
    public static var horizontalFlow: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        return layout
    }
}
