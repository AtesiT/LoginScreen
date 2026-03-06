import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    private let contentViewVM = ContentViewViewModel()
    
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
                title: contentViewVM.buttonTitle,
                color: .red,
                action: contentViewVM.startTimer
            )
            
            Spacer()
            
            Spacer()
            
            ButtonView(
                title: "LogOut",
                color: .blue,
                action: loginViewVM.logout
            )
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LoginViewViewModel())
    }
}
