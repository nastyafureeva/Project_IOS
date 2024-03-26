//
//  MainViewModel.swift
//  CarRental
//
//  Created by marwa awwad mohamed awwad on 24/03/2024.
//

import UIKit

class MainViewModel {
    
    var isLoading : Observable<Bool> = Observable(false)
    var dataSource: Cars?
    var cellDataSource: Observable<[MainTableCellViewModel]> = Observable([])
  
    
    //retain the data back to the view controller
    func numberOfSections() -> Int {
        return dataSource?.count ?? 0
    }
    func numberOfRows(in section: Int) -> Int {
        return cellDataSource.value?.count ?? 0
    }
    
    func fetchData() {
        if isLoading.value ?? true{
            return
        }
        isLoading.value = true
        APICaller.getCars { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let data):
                print(data.count)
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print("Error\(error.localizedDescription)")
            }
        }
    }

    func mapCellData() {
        
        self.cellDataSource.value = self.dataSource?.compactMap({MainTableCellViewModel(car: $0)})
    }
}
