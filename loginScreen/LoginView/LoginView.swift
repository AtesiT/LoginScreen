import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    @State private var showAlert = false
    
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
                //  Терарный оператор для измнения цвета счётчика
                    .foregroundStyle(loginViewVM.name.count >= 3 && loginViewVM.name.count < 20 ? .green : .red)
            }
            .padding(.bottom, 15)
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
                    .foregroundStyle(loginViewVM.name.count >= 3 && loginViewVM.name.count < 20 ? .blue : .gray)
            }
        }
        .alert("Ошибка", isPresented: $showAlert) {
            Button("ОК", role: .cancel) {}
        } message: {
            Text("Имя пользователя не должно быть короче 3-ёх символов")
        }
    }
    
    private func login() {
        if !(loginViewVM.name.count < 3) {
            loginViewVM.isLoggedIn.toggle()
        } else {
            showAlert = true
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
