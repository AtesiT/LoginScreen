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
        Button("Start") {
            timer -= 1
        }
    }
}
