import SwiftUI

//  Создаём сингельтон для хранения данных один раз
final class StorageManager {
    static let shared = StorageManager()
    
    //  AppStorage позволяет использовать userDefaults, без использования методов .set и .object
    @AppStorage("user") private var userData: Data?
    
    private init() {}
        
    //  MARK: - METHODS
    
    //  Сохранить в UserDefaults
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    //  Восстанавливаем наши данные из UserDefaults. Метод возвращает готовый зкземпляр модели.
    func fetchUser() -> User {
        guard let userData else { return User() }
        let user = try? JSONDecoder().decode(User.self, from: userData)
        return user ?? User()
    }
    
    //  Очистить
    func clear() {
        userData = nil
    }
}
