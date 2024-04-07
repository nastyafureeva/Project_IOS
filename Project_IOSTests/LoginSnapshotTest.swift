//
//  LoginSnapshotTest.swift
//  Project_IOSTests
//
//  Created by Аделя Миннехузина on 07.04.2024.
//

import XCTest
import SnapshotTesting

@testable import Project_IOS
final class LoginSnapshotTest: XCTestCase {

    // MARK: - Миннехузина Аделя
    func testSignInViewController() {

        let signInController = SignInViewController()
        assertSnapshot(of: signInController, as: .image)

    }

    // MARK: - Миннехузина Аделя
    func testSignUpViewController() {

        let signUpController = SignUpViewController()
        assertSnapshot(of: signUpController, as: .image(on: .iPadMini))

    }

}
