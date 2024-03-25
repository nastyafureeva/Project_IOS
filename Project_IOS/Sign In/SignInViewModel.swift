//
//  SignInViewModel.swift
//  Project_IOS
//
//  Created by Аделя Миннехузина on 25.03.2024.
//

import Foundation
import FirebaseAuth

// MARK: - Миннехузина Аделя
protocol SignInViewModelDelegate {
    func sendValue(from email: String?, password: String?)
}

class SignInViewModel: SignInViewModelDelegate {

    var showAlertClosure: ((String) -> Void)?
    var signInCompletion: ((String?, String?) -> Void)?

    func sendValue(from email: String?, password: String?) {

        guard let email = email, let password = password else { return }

        if email.isEmpty || password.isEmpty {
            showAlertClosure?("Заполните все поля")
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if error != nil {
                    self.showAlertClosure?("Неправильный email или пароль")
                } else if let result = result {
                    self.signInCompletion?(result.user.displayName, result.user.email)
                }
            }
        }
    }

}
