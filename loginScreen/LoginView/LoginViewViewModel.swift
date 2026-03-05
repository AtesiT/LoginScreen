import Foundation
import SwiftUI
import Combine

final class LoginViewViewModel: ObservableObject {
    @Published var name = StorageManager.shared.fetchUserName()
    @AppStorage("isLoggedIn") var isLoggedIn = false
}
