import SwiftUI

@main
struct loginScreenApp: App {
    //  Данное свойство инициализируются в корневом представлении, т.к. он единственный источник данных. Но можно и выносить в корневую структуру.
    @StateObject private var contentViewVM = ContentViewViewModel()
    @StateObject private var loginViewVM = LoginViewViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                //  Как только срабатывает метод жизненного цикла onAppear, мы передаём loginViewVM
                .onAppear {
                    contentViewVM.loginViewVM = loginViewVM
                }
        }
        //  Предоставляем доступ из любого дочернего представления. Из любого места в программе, можем обратиться к данному экземпляру класса.
        .environmentObject(contentViewVM)
        .environmentObject(loginViewVM)
    }
}

//  MARK: - NOTE ABOUT WRAPPERS

//  @StateObject - обозначить экземпляр класса обновляемым. Предварительно до этого, необходимо подписать класс под ObservableObject. И создать в нём константу objectWillChange с ObservableObjectPublisher()
//  @EnvironmentObject - обратиться к свойству и получить доступ из любого места (ссылка на окружение, в котором хранится этот объект)
//  @ObservedObject - это как Binding, только для работы с классами, что подписаны под протокол ObservableObject
//  @Published - позволяет следить за состоянием свойства. (Предварительно класс необходимо подписать под протокол ObservableObject.
