import SwiftUI

struct ContentView: View {
    //  Получаем доступ к экземпляру класса из окружения. Затем, определяем тип данных, но не инициализируем (потому что он уже иницииализирован и находится в окружении).
    @EnvironmentObject private var contentViewVM: ContentViewViewModel
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        
        VStack {
            Text("Hello, \(loginViewVM.name)!")
                .padding(.top, 100)
                .font(.largeTitle)
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(contentViewVM: contentViewVM, buttonColor: .red, buttonTitle: contentViewVM.buttonTitle)
            
            Spacer()
            
            Spacer()
            
            ButtonView(contentViewVM: contentViewVM, buttonColor: .blue, buttonTitle: "LogOut")
        }
    }
}

#Preview {
    ContentView()
        //  Создаём локально в LivePreview
        .environmentObject(ContentViewViewModel())
        .environmentObject(LoginViewViewModel())
}

struct ButtonView: View {
    @ObservedObject var contentViewVM: ContentViewViewModel
    let buttonColor: Color
    let buttonTitle: String
    
    var body: some View {
        //  По-другому инициализируем кнопку, потому что хотим изменить внешний вид её
        Button(action: { contentViewVM.startTimer() }) {
            Text(buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(buttonColor)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}
