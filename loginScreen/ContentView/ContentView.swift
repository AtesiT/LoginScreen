import SwiftUI

struct ContentView: View {
    @State private var timer = 3
    
    var body: some View {
        VStack {
            Text(timer.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(timer: $timer)
            
            Spacer()
            
        }
    }
}

#Preview {
    ContentView()
}

struct ButtonView: View {
    @Binding var timer: Int
    
    var body: some View {
        //  По-другому инициализируем кнопку, потому что хотим изменить внешний вид ёё
        Button(action: { timer -= 1}) {
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
