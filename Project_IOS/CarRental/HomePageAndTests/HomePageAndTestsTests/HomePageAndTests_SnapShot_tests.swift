//
//  HomePageAndTests_SnapShot_tests.swift
//  HomePageAndTestsUITests
//
//  Created by marwa awwad mohamed awwad on 09/04/2024.
//

import XCTest
import SnapshotTesting
@testable import HomePageAndTests
final class HomePageAndTests_SnapShot_tests: XCTestCase {

    func testExample() throws {
        let mainViewController = MainViewController()
                assertSnapshot(of:  mainViewController, as: .image )
        
    }
}
