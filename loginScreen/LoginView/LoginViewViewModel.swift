import Foundation
import Combine

final class LoginViewViewModel: ObservableObject {
    //  Добавляем обёртку @Published для свойства name, чтобы сообщать об изменении значения свойства
    @Published var name = ""
    @Published var isLoggedIn = false
    
}
