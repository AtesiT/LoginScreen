import SwiftUI

struct ContentView: View {
    //  Получаем доступ к экземпляру класса из окружения. Затем, определяем тип данных, но не инициализируем (потому что он уже иницииализирован и находится в окружении).
    @EnvironmentObject private var contentViewVM: ContentViewViewModel
    var body: some View {
        VStack {
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(contentViewVM: contentViewVM)
            
            Spacer()
            
        }
    }
}

#Preview {
    ContentView()
        //  Создаём локально в LivePreview
        .environmentObject(ContentViewViewModel())
}

struct ButtonView: View {
    @ObservedObject var contentViewVM: ContentViewViewModel
    
    var body: some View {
        //  По-другому инициализируем кнопку, потому что хотим изменить внешний вид её
        Button(action: { contentViewVM.startTimer() }) {
            Text("Start")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}
