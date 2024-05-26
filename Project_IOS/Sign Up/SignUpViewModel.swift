//
//  SignUpViewModel.swift
//  Project_IOS
//
//  Created by Аделя Миннехузина on 25.03.2024.
//

import Foundation
import FirebaseAuth
// MARK: - Миннехузина Аделя
protocol SignUpViewModelDelegate {
    func sendValue(from name: String?, email: String?, password: String?)
}

class SignUpViewModel: SignUpViewModelDelegate {

    var showAlertClosure: ((String) -> Void)?
    var signInCompletion: ((String?, String?) -> Void)?

    func sendValue(from name: String?, email: String?, password: String?) {

        guard let name = name, let email = email, let password = password else { return }

        if name.isEmpty || email.isEmpty || password.isEmpty {
            showAlertClosure?("Заполните все поля")
        } else {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let result = result {
                    let changeRequest = result.user.createProfileChangeRequest()
                    changeRequest.displayName = name
                    changeRequest.commitChanges { _ in
                        self.signInCompletion?(result.user.displayName, result.user.email)
                    }
                }
            }
        }
    }

}
