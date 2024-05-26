// MARK: - Фуреева Анастасия
import Foundation
import FirebaseAuth
class ConversationsViewModel: ObservableObject {

    @Published var isHidden: Bool = true
    @Published var noConversationsLabelHidden: Bool = true
    @Published var navigateToChats: Bool = false
    @Published var navigateToBooks: Bool = false

    init() {
    }

    func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            navigateToChats = true
        } else {
            fetchConversations()
        }
    }

    func fetchConversations() {

        self.isHidden = false
        self.noConversationsLabelHidden = true

        
    }
    func navigateToBooksFunc() {
        navigateToBooks = true
        }
}
