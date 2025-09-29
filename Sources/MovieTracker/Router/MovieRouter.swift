import TokamakShim

enum Page {
    case profile
    case home
    case detail(movieID: Int)
    case favorites
}

@MainActor
class MovieRouter: ObservableObject {
    @Published var currentPage: Page = .profile

    func goToDetail(movieID: Int) {
        currentPage = .detail(movieID: movieID)
    }

    func goToFavorites() {
        currentPage = .favorites
    }

    func goHome() {
        currentPage = .home
    }

    func goProfile() {
        currentPage = .profile
    }
}
