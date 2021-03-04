//
//  ArticlesCollectionViewCell.swift
//  AlteraTest
//
//  Created by Альберт on 02.03.2021.
//

import UIKit
import SDWebImage

class ArticlesCollectionViewCell: UICollectionViewCell {
    
    weak var viewModel: ArticlesCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.label
            urlImage.sd_setImage(with: URL(string: "\(viewModel.image)"), completed: nil)
        }
    }
    
    static let identifire = "ArticlesCollectionViewCell"
    
    private var titleLabel: Label!
    private var urlImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    private func configure(){
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setupViews() {
        self.titleLabel = Label()
        self.titleLabel.apply(style: .default)
        self.urlImage = UIImageView()
        
        let superview = self.contentView
        [self.titleLabel].forEach { (label) in
            label.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let stackView = UIStackView(arrangedSubviews: [self.titleLabel])
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        
        superview.addSubviewForAutolayout(stackView)
        stackView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 16).isActive = true
        stackView.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 16).isActive = true
        stackView.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -16).isActive = true
        
        
        superview.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        superview.layer.cornerRadius = 20
        superview.layer.masksToBounds = false
        superview.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65).cgColor
        superview.layer.shadowOpacity = 0.8
        superview.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        superview.layer.shadowRadius = 5.0
        superview.layer.cornerRadius = 5.0
        
        superview.addSubviewForAutolayout(urlImage)
        
        urlImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        urlImage.widthAnchor.constraint(equalToConstant: superview.frame.width - 20).isActive = true
        urlImage.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: 0).isActive = true
        urlImage.topAnchor.constraint(equalTo: stackView.bottomAnchor , constant: 20).isActive = true
        urlImage.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -16).isActive = true
        
    }
    
    override public func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize: CGSize
        let horizontalPriority: UILayoutPriority
        let verticalPriority: UILayoutPriority
        targetSize = .init(width: layoutAttributes.size.width, height: UIView.layoutFittingCompressedSize.height)
        horizontalPriority = .required
        verticalPriority = .defaultLow
        layoutAttributes.size = self.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalPriority, verticalFittingPriority: verticalPriority)
        layoutAttributes.size.height.round(.up)
        layoutAttributes.size.width.round(.up)
        return layoutAttributes
    }
}

