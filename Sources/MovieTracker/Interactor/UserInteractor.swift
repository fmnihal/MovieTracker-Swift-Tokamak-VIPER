import TokamakShim

protocol UserInteractorProtocol {
    func login(username: String, password: String) -> Bool
    func logout()
    func addFavorite(user: inout User, movie: Movie)
    func removeFavorite(user: inout User, movie: Movie)
}

class UserInteractor: UserInteractorProtocol, ObservableObject {
    @Published var currentUser: User?

    func login(username: String, password: String) -> Bool {
        let mockUser = User(username: "test", password: "1234")
        if username == mockUser.username && password == mockUser.password {
            currentUser = mockUser
            return true
        }
        return false
    }

    func logout() {
        currentUser = nil
    }

    func addFavorite(user: inout User, movie: Movie) {
        if !user.favorites.contains(where: { $0.id == movie.id }) {
            user.favorites.append(movie)
        }
    }

    func removeFavorite(user: inout User, movie: Movie) {
        user.favorites.removeAll(where: { $0.id == movie.id })
    }
}
