import SwiftUI

@main
struct loginScreenApp: App {
    //  Данное свойство инициализируются в корневом представлении, т.к. он единственный источник данных. Но можно и выносить в корневую структуру.
    @StateObject private var contentViewVM = ContentViewViewModel()
    @StateObject private var loginViewVM = LoginViewViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        //  Предоставляем доступ из любого дочернего представления. Из любого места в программе, можем обратиться к данному экземпляру класса.
        .environmentObject(contentViewVM)
        .environmentObject(loginViewVM)
    }
}
