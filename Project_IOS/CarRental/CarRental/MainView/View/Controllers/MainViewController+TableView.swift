//
//  MainViewController+tableView.swift
//  CarRental
//
//  Created by marwa awwad mohamed awwad on 24/03/2024.
//

import UIKit

extension MainViewController {

    func layouts() {
        view.addSubview(tableView)
        view.addSubview(filterButton)
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            make.bottom.equalTo(tableView.snp.top).offset(0)
            make.top.equalToSuperview().inset(150)
            make.left.equalToSuperview().inset(5)
            make.right.equalToSuperview().inset(40)
            make.height.equalTo(40)
        }
        
        filterButton.snp.makeConstraints { make in
            make.bottom.equalTo(tableView.snp.top).offset(-5)
            make.right.equalToSuperview().inset(4)
            make.left.equalTo(searchBar.snp.right).inset(-5)
            make.height.equalTo(30)
            make.width.equalTo(50)
            
        }
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 200, left: 5, bottom: 10, right: 5 ))
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section )
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MainViewControllerCells else {
            fatalError("Failed to dequeue MainViewControllerCells.")
        }
        
        guard indexPath.row < cellDataSource.count else {
            return cell
        }
        cell.configureCell(with: cellDataSource[indexPath.row])
        return cell
    }
}

extension MainViewController: UISearchBarDelegate {
    
}
