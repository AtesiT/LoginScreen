import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack {
            //  Используем ZStack, чтобы разместить элементы над друг другом и используем .trailing к нему, чтобы прижать вправо. Из-за того, что TextField занимает всю ширину, он прижмется влево, а Text прижмтся вправо.
            ZStack(alignment: .trailing) {
                TextField("Type your name...", text: $loginViewVM.name)
                //  Устанавливаем padding, чтобы тем самым сузить textField
                    .padding(.horizontal, 50)
                //  Размещаем по центру
                    .multilineTextAlignment(.center)
                Text("\(loginViewVM.name.count)")
                //  Устанавилваем padding справа, это отодвинет наш объект влево
                    .padding(.trailing, 25)
            }
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
            }
        }
    }
    
    private func login() {
        if !loginViewVM.name.isEmpty {
            loginViewVM .isLoggedIn.toggle()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
