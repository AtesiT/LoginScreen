import SwiftUI

struct LoginView: View {
    //  Создаём экземпляр класса loginViewViewModel
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
    }
}

struct TextFieldView: View {
    @ObservedObject var loginViewVM: LoginViewViewModel
    
    var body: some View {
        TextField("Type your name...", text: $loginViewVM.user.name)
            .multilineTextAlignment(.center)
        HStack {
            Spacer()
            Text(loginViewVM.userNameCharCount)
                .font(.callout)
                .foregroundStyle(loginViewVM.nameIsValid ? .green : .red)
                .padding([.top, .trailing])
        }
        .padding(.bottom)
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
