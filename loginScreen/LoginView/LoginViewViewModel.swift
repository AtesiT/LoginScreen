import Foundation
import Combine

final class LoginViewViewModel: ObservableObject {
    var name = ""
    @Published var isLoggedIn = false
    
}
