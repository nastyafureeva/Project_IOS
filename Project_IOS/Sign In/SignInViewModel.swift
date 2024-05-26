//
//  SignInViewModel.swift
//  Project_IOS
//
//  Created by Аделя Миннехузина on 25.03.2024.
//

import Foundation
import FirebaseAuth

// MARK: - Миннехузина Аделя
class SignInViewModel: ObservableObject {

    var signInCompletion: ((String?, String?) -> Void)?

    func sendValue(from email: String?, password: String?) {
        guard let email = email, let password = password else { return }

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                self.signInCompletion?(result.user.displayName, result.user.email)
            }
        }
    }
}
