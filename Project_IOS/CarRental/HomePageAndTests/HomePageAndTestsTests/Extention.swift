//
//  Extention.swift
//  HomePageAndTestsTests
//
//  Created by marwa awwad mohamed awwad on 08/04/2024.
//

import Foundation
@testable import HomePageAndTests
extension Car: Equatable {
    public static func == (lhs: Car, rhs: Car) -> Bool {
        lhs.model.rawValue.lowercased() == rhs.model.rawValue.lowercased()
    }
}
