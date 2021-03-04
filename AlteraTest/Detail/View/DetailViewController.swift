//
//  DetailViewController.swift
//  AlteraTest
//
//  Created by Альберт on 02.03.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var detailTableView: UITableView!
    
    var viewModel: DetailViewModelType?
    
    override func loadView() {
        let view = UIView()
        self.detailTableView = UITableView()
        self.detailTableView.translatesAutoresizingMaskIntoConstraints = false
        self.detailTableView.dataSource = self
        self.detailTableView.delegate = self
        
        view.addSubview(self.detailTableView)
        
        self.detailTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.detailTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.detailTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.detailTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  
        self.detailTableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifire)
        self.detailTableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.identifire)

        self.view = view
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.detailTableView.estimatedRowHeight = 10
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        
        case 0:
        guard let viewModel = self.viewModel,
              let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifire, for: indexPath) as? ImageTableViewCell
            else {
            return UITableViewCell()
        }
            cell.imageUrlString = viewModel.image
            return cell
        
        case 1:
        guard let viewModel = self.viewModel,
              let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifire, for: indexPath) as? TitleTableViewCell
            else {
            return UITableViewCell()
        }
            cell.titleString = viewModel.title
            return cell
            
        case 2:
            guard let viewModel = self.viewModel,
                  let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifire, for: indexPath) as? TitleTableViewCell
                else {
                return UITableViewCell()
            }
                cell.titleString = viewModel.description
                return cell
        
        default:
            return UITableViewCell()

        }
    }
}
