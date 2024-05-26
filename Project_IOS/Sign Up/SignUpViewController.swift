//
//  SignUpViewController.swift
//  Project_IOS
//
//  Created by Аделя Миннехузина on 25.03.2024.
//

import UIKit
import SwiftUI

// MARK: - Миннехузина Аделя
protocol ViewControllerDelegate: AnyObject {
    func getInfoBack(name: String?, email: String?)
}

class SignUpViewController: UIViewController {

    private var viewModel = SignUpViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.showAlertClosure = { [weak self] (message: String) -> Void in
            self?.showAlert(message: message)
        }

        viewModel.signInCompletion = { [weak self] name, email in
            self?.getInfoBack(name: name, email: email)
        }

        setUpLayouts()
    }

    @objc private func loginButtonTapped() {
        viewModel.sendValue(from: nameTextField.text, email: emailTextField.text, password: passwordTextField.text)
    }

    @objc private func switchButtonTapped() {
        let signInView = SUISignInView(viewModel: SignInViewModel())
        let hostingController = UIHostingController(rootView: signInView)
        hostingController.modalPresentationStyle = .fullScreen
        present(hostingController, animated: true)
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    // Generic func (Миннехузина Аделя)
    func displayData<T>(data: [T]) {
        print("User's info:", data)
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.font = UIFont.systemFont(ofSize: 35, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "nameTextField"
        return textField
    }()

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите email"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "emailTextField"
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите пароль"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "passwordTextField"
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Готово", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 7
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "loginButton"
        return button
    }()

    private lazy var switchLabel: UILabel = {
        let label = UILabel()
        label.text = "Есть аккаунт?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var switchButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(switchButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "switchButton"
        return button
    }()

    private lazy var fieldStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameTextField, emailTextField, passwordTextField])
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var switchStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [switchLabel, switchButton])
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    func setUpLayouts(){
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(fieldStackView)
        view.addSubview(loginButton)
        view.addSubview(switchStackView)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            fieldStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            fieldStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            fieldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 80),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 70),
            loginButton.heightAnchor.constraint(equalToConstant: 37),

            switchStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switchStackView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 25),
        ])
    }

}

extension SignUpViewController: ViewControllerDelegate {

    func getInfoBack(name: String?, email: String?) {
        guard let name = name else { return }
        guard let email = email else { return }
        print("User successfully signed up!")
        displayData(data: [name, email])

        // TODO: push to profile screen
    }

}

