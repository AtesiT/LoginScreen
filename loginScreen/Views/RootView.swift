import SwiftUI

struct RootView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        if loginViewVM.user.isLoggedIn {
            ContentView()
        } else {
            LoginView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(LoginViewViewModel())
    }
}
