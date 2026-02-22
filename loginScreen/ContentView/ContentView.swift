import SwiftUI

struct ContentView: View {
    private let contentViewVM = ContentViewViewModel()
    
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
}

struct ButtonView: View {
    let contentViewVM: ContentViewViewModel
    
    var body: some View {
        //  По-другому инициализируем кнопку, потому что хотим изменить внешний вид ёё
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
