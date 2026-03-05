import Foundation

//  Создаём сингельтон для хранения данных один раз
final class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    private let theUserKey = "userName"
    private let theLoginKey = "isLogin"
    
    //  MARK: - METHODS
    
    //  Сохраняем переданные значения в UserDefaults под определенными ключами
    func saveData(isLogin: Bool, userName: String) {
        UserDefaults.standard.set(isLogin, forKey: theLoginKey)
        UserDefaults.standard.set(userName, forKey: theUserKey)
    }
    
    //  Восстанавливаем данные - имя пользователя
    func fetchUserName() -> String {
        return UserDefaults.standard.string(forKey: theUserKey) ?? ""
    }
    
    //  Восстанавливаем данные - совершён вход или нет
    func fetchIsLogin() -> Bool {
        return UserDefaults.standard.bool(forKey: theLoginKey)
    }
}
