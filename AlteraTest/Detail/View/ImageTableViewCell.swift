//
//  ImageTableViewCell.swift
//  AlteraTest
//
//  Created by Альберт on 02.03.2021.
//

import UIKit
import SDWebImage

class ImageTableViewCell: UITableViewCell {
    
    var imageUrlString: String? {
        didSet {
            
            guard let urlString = self.imageUrlString else { return }
            self.headerImage.sd_setImage(with: URL(string: urlString)) { (_, error, _, url) in
                print(error?.localizedDescription)
            }
        }
    }
    
    static let identifire: String = "ImageTableViewCell"
    //   private var titleLabel: Label!
    private var headerImage: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure(){
        setupViews()
    }
    
    private func setupViews() {
        self.headerImage = UIImageView()
        let superview = self.contentView
        superview.addSubviewForAutolayout(headerImage)
        
        headerImage.heightAnchor.constraint(equalToConstant: superview.frame.width - 20).isActive = true
        headerImage.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -16).isActive = true
        headerImage.topAnchor.constraint(equalTo: superview.topAnchor, constant: 16).isActive = true
        
        headerImage.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16).isActive = true
        headerImage.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16).isActive = true
    }
}



