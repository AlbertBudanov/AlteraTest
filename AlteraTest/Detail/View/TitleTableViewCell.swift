//
//  TitleTableViewCell.swift
//  AlteraTest
//
//  Created by Альберт on 02.03.2021.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    var titleString: String? {
        didSet {
            self.titleLabel.text = titleString
        }
    }
    
    static let identifire: String = "TitleTableViewCell"
    private var titleLabel: Label!
    
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
        self.titleLabel = Label()
        self.titleLabel.apply(style: .default)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let superview = self.contentView
        
        let stackView = UIStackView(arrangedSubviews: [self.titleLabel])
        
        stackView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        stackView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.alignment = .fill
        
        superview.addSubviewForAutolayout(stackView)
        stackView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 16).isActive = true
        stackView.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 16).isActive = true
        stackView.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -16).isActive = true
        
    }
    
}
