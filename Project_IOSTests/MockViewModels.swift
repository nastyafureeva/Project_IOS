//
//  MockViewModesl.swift
//  Project_IOSTests
//
//  Created by Аделя Миннехузина on 07.04.2024.
//

import Foundation

// MARK: - Миннехузина Аделя
@testable import Project_IOS
class MockSignUpViewModel: SignUpViewModelDelegate {

    var receivedName: String?
    var receivedEmail: String?
    var receivedPassword: String?

    func sendValue(from name: String?, email: String?, password: String?) {
        receivedName = name
        receivedEmail = email
        receivedPassword = password
    }
}

class MockSignInViewModel: SignInViewModelDelegate {

    var receivedEmail: String?
    var receivedPassword: String?

    func sendValue(from email: String?, password: String?) {
        receivedEmail = email
        receivedPassword = password
    }
}
