// MARK: - Фуреева Анастасия
import XCTest
@testable import Project_IOS

class ConversationsViewControllerUITests: XCTestCase {

    // MARK: - Тест отображения списка диалогов

    func testDisplayConversations() {

        let app = XCUIApplication()
        app.launch()


        let tableView = app.tables["conversationsTableView"]
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: tableView, handler: nil)
        waitForExpectations(timeout: 10)


        XCTAssertTrue(tableView.cells.count > 0)
    }

    // MARK: - Тест отображения сообщения об отсутствии диалогов

    func testDisplayNoConversationsMessage() {

        let app = XCUIApplication()
        app.launchArguments = ["-FIRFirestoreDisableFirestore"]
        app.launch()


        let tableView = app.tables["conversationsTableView"]
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: tableView, handler: nil)
        waitForExpectations(timeout: 10)


        XCTAssertTrue(tableView.cells.count == 0)


        let noConversationsLabel = app.staticTexts["noConversationsLabel"]
        XCTAssertTrue(noConversationsLabel.exists)
    }
}
