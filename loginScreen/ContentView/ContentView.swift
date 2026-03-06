import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    private var contentViewVM: ContentViewViewModel
    
    var body: some View {
        
        VStack {
            Text("Hello, \(loginViewVM.user.name)!")
                .padding(.top, 100)
                .font(.largeTitle)
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(
                buttonColor: .red,
                buttonTitle: contentViewVM.buttonTitle,
                buttonAction: contentViewVM.startTimer
            )
            
            Spacer()
            
            Spacer()
            
            ButtonView(
                buttonColor: .blue,
                buttonTitle: "LogOut",
                buttonAction: contentViewVM.logout
            )
        }
    }
}

#Preview {
}
