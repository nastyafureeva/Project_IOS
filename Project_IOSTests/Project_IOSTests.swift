//
//  Project_IOSTests.swift
//  Project_IOSTests
//
//  Created by Kseniya Skvortsova on 24.03.2024.
//

import XCTest
@testable import Project_IOS

final class Project_IOSTests: XCTestCase {

    lazy var signUpviewModel = MockSignUpViewModel()
    lazy var signInviewModel = MockSignInViewModel()

    // MARK: - Миннехузина Аделя
    func test_send_signUp_value() {

        // GIVEN
        let name = "Ann"
        let email = "ann@example.com"
        let password = "123456"

        // WHEN
        signUpviewModel.sendValue(from: name, email: email, password: password)

        // THEN
        XCTAssertEqual(signUpviewModel.receivedName, name)
        XCTAssertEqual(signUpviewModel.receivedEmail, email)
        XCTAssertEqual(signUpviewModel.receivedPassword, password)
    }

    // MARK: - Миннехузина Аделя
    func test_send_signIn_value() {

        // GIVEN
        let email = "john@example.com"
        let password = "password"

        // WHEN
        signInviewModel.sendValue(from: email, password: password)

        // THEN
        XCTAssertEqual(signInviewModel.receivedEmail, email)
        XCTAssertEqual(signInviewModel.receivedPassword, password)
    }

    // MARK: - Миннехузина Аделя
    func test_show_alert_closure() {

        // GIVEN
        let viewModel = SignUpViewModel()
        var capturedMessage: String?

        // WHEN
        viewModel.showAlertClosure = { message in
            capturedMessage = message
        }
        viewModel.showAlertClosure?("Test message")

        // THEN
        XCTAssertEqual(capturedMessage, "Test message")
    }

}
