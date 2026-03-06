import SwiftUI
import Combine

final class LoginViewViewModel: ObservableObject {
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.name >= 3
    }
    
    var userNameCharCount: String {
        user.name.count.formatted()
    }
    
    //  Определяем приватное свойство, после всех публичных свойств
    private let storageManager = StorageManager.shared
    
    init(user: User = User()) {
        self.user = user
    }
    
    func login() {
        user.isLoggedIn.toggle()
        storageManager.save(user: user)
    }
    
    func logout() {
        user.name = ""
        user.isLoggedIn.toggle()
        //  Удаляем объект из памяти
        storageManager.clear()
    }
}
