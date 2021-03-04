//
//  UIView+.swift
//  AlteraTest
//
//  Created by Альберт on 02.03.2021.
//

import UIKit


extension UIView{
    
    public func addSubviewForAutolayout(_ view: UIView){
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
}
