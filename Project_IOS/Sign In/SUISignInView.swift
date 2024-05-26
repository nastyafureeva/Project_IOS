//
//  SUISignInView.swift
//  Project_IOS
//
//  Created by Аделя Миннехузина on 26.05.2024.
//

import SwiftUI

// MARK: - Миннехузина Аделя
struct SUISignInView: View {

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isDarkMode: Bool = false
    @State private var showSignUpView = false
    @ObservedObject var viewModel: SignInViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Вход")
                    .font(.system(size: 35)).fontWeight(.semibold)
                    .padding(.top, 60)

                TextField("Введите email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 25)
                    .padding(.top, 60)

                SecureField("Введите пароль", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 25)

                Button(action: {
                    viewModel.sendValue(from: email, password: password)
                }) {
                    Text("Готово")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(7)
                }
                .padding(.top, 80)

                HStack {
                    Text("Нет аккаунта?")
                    Button(action: {
                        showSignUpView.toggle()
                    }) {
                        Text("Зарегистрироваться")
                            .foregroundColor(.blue)
                    }
                    .fullScreenCover(isPresented: $showSignUpView) {
                        SignUpViewControllerWrapper()
                    }
                }
                .padding(.top, 15)

                Toggle(isOn: $isDarkMode) {
                    Text("Темная тема")
                }
                .padding(.horizontal, 50)
                .onChange(of: isDarkMode) { value in
                    UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = value ? .dark : .light
                }

                Spacer()
            }
            .onAppear {
                viewModel.signInCompletion = { name, email in
                    print("User successfully signed up!")
                    print("Name: \(name ?? "No name"), Email: \(email ?? "No email")")
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SUISignInView(viewModel: SignInViewModel())
    }
}

struct SignUpViewControllerWrapper: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> SignUpViewController {
        let signUpViewController = SignUpViewController()
        return signUpViewController
    }

    func updateUIViewController(_ uiViewController: SignUpViewController, context: Context) {
    }
}

extension UIApplication {
    var keyWindow: UIWindow? {
        return connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
}
