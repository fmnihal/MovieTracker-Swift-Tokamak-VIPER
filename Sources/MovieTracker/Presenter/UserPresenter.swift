struct UserPresenter {
    func welcomeMessage(user: User) -> String {
        return "Welcome, \(user.username)!"
    }

    func loginFailedMessage() -> String {
        return "Invalid credentials"
    }
}
