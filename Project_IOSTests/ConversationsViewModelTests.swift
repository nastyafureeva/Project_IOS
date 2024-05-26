import XCTest
import Combine
import Firebase
@testable import Project_IOS

class ConversationsViewModelTests: XCTestCase {


    // MARK: - Тест навигации к списку книг

    func testNavigateToBooks() {
        let mockNavigationController = MockUINavigationController()

        let vc = ConversationsViewController()
        let mockNavController = MockUINavigationController(rootViewController: vc)
        vc.viewModel.navigateToBooksFunc()
        XCTAssertTrue(mockNavigationController.pushViewControllerCalled)
    }
}


class MockUINavigationController: UINavigationController {

    var pushViewControllerCalled = false

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewControllerCalled = true
    }
}

