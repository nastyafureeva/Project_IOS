//
//  Project_IOSUITests.swift
//  Project_IOSUITests
//
//  Created by Kseniya Skvortsova on 24.03.2024.
//

import XCTest

final class Project_IOSUITests: XCTestCase {

    // MARK: - Миннехузина Аделя
    func test_switchButton_presents_signUp() throws {

        let app = XCUIApplication()
        app.launch()

        // GIVEN
        let switchButton = app.buttons["switchButton"]
        let signInScreen = app.otherElements["SignInScreen"]

        // WHEN
        switchButton.tap()

        // THEN
        XCTAssertTrue(signInScreen.exists)
    }

    // MARK: - Миннехузина Аделя
    func test_signUp_elements_exist() throws {

        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["Регистрация"].exists)
        XCTAssertTrue(app.textFields["nameTextField"].exists)
        XCTAssertTrue(app.textFields["emailTextField"].exists)
        XCTAssertTrue(app.secureTextFields["passwordTextField"].exists)
        XCTAssertTrue(app.buttons["loginButton"].exists)
        XCTAssertTrue(app.buttons["switchButton"].exists)

    }
    
}
