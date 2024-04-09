//
//  HomePageAndTestsTests.swift
//  HomePageAndTestsTests
//
//  Created by marwa awwad mohamed awwad on 08/04/2024.
//

import XCTest
@testable import HomePageAndTests


final class HomePageAndTestsTests: XCTestCase {
    let viewModel: MainViewModel = MainViewModel()
      
   //1
    func test_filterCars_from_MainViewModel() {
        //Given
        let myString: String = viewModel.searchText.lowercased()
        var datasource: [Cars] = [.init() ]
        
        //When
        viewModel.filterCars(myString)
        
        //Then
        XCTAssertNotNil(datasource)
        }
    
    // 2
        func test_mapCellData_from_MainViewModel() {
            //Given
            let cars: Cars = []
            viewModel.dataSource = cars
            //When
            viewModel.mapCellData()
            //Then
            XCTAssertEqual(viewModel.cellDataSource.value?.count, cars.count)
        }
    

    //3
    func test_numberOfRows_whenNotSearching_and_cellDataSourceIsNil() {
         // Given
         viewModel.isSearching = false
         viewModel.cellDataSource.value = nil
         
         // When
         let numberOfRows = viewModel.numberOfRows(in: 0)
         
         // Then
         XCTAssertEqual(numberOfRows, 0)
     }
    
    //4
    func test_numberOfRows_whenSearching_and_filteredDataSourceIsNil() {
        // Given
        viewModel.isSearching = true
        viewModel.filteredDataSource.value = nil
        
        // When
        let numberOfRows = viewModel.numberOfRows(in: 0)
        
        // Then
        XCTAssertEqual(numberOfRows, 0)
    }


}
