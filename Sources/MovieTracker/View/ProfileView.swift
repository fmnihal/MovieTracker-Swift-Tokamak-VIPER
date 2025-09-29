import TokamakShim

struct ProfileView: View {
    @ObservedObject var router: MovieRouter
    @State private var username = ""
    @State private var password = ""
    @State private var loginMessage = ""
    @StateObject private var interactor = UserInteractor()
    let presenter = UserPresenter()

    var body: some View {
        VStack {
            Text("Login").font(.title)
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            Button("Login") {
                if interactor.login(username: username, password: password) {
                    loginMessage = presenter.welcomeMessage(user: interactor.currentUser!)
                    router.goHome()
                } else {
                    loginMessage = presenter.loginFailedMessage()
                }
            }
            Text(loginMessage).foregroundColor(.red)
        }
        .padding()
    }
}
