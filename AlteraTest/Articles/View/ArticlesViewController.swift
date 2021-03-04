//
//  ArticlesViewController.swift
//  AlteraTest
//
//  Created by Альберт on 01.03.2021.
//

import UIKit

class ArticlesViewController: UIViewController {
    
    private var articlesCollectionView: UICollectionView!
    private var collectionViewFlowLayout: UICollectionViewFlowLayout!

    var viewModel: ArticlesViewModelType?
    
    override func loadView() {
        let view = UIView()
        self.collectionViewFlowLayout = .verticalFlow
        self.articlesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        self.articlesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.articlesCollectionView.backgroundColor = .white
        self.articlesCollectionView.contentInset = .init(top: 10, left: 30, bottom: 10, right: 30)
        self.articlesCollectionView.dataSource = self
        self.articlesCollectionView.delegate = self
        view.addSubview(self.articlesCollectionView)
        self.articlesCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.articlesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.articlesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.articlesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        self.articlesCollectionView.register(ArticlesCollectionViewCell.self, forCellWithReuseIdentifier: ArticlesCollectionViewCell.identifire)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = ViewModel()
        self.loadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionViewFlowLayout.estimatedItemSize = CGSize(width: view.bounds.size.width - 60, height: 50)
    }
    
    private func loadData() {
        viewModel?.loadData { [weak self] in
            guard let strongSelf = self else { return }
            guard strongSelf.viewModel?.numberOfRows() ?? 0 > 0 else {
                strongSelf.showAlertError()
                return
            }
            strongSelf.articlesCollectionView.reloadData()
        }
    }
    
    private func showAlertError() {
        let ac = UIAlertController(title: "Error", message: "0 rows", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        ac.addAction(ok)
        present(ac, animated: true)
    }
}

extension ArticlesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = self.viewModel else {
            return 0
        }
        return viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let viewModel = self.viewModel,
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticlesCollectionViewCell.identifire, for: indexPath) as? ArticlesCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        cell.viewModel = cellViewModel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = self.viewModel else { return }
        viewModel.selectRow(atIndexPath: indexPath)
        self.showDetail()
    }
}

// MARK: Navigation
extension ArticlesViewController {
    
    private func showDetail(){
        guard let viewModel = self.viewModel else { return }
        let viewController = DetailViewController()
        viewController.viewModel = viewModel.viewModelForSelectedRow()
        self.show(viewController, sender: self)
    }
    
    
}
