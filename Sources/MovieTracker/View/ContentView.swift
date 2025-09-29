import TokamakShim

struct ContentView: View {
    @StateObject var router = MovieRouter()

    var body: some View {
        VStack {
            switch router.currentPage {
            case .profile:
                ProfileView(router: router)
            case .home:
                HomeView(router: router)
            case .detail(let movieID):
                MovieDetailView(movieID: movieID, router: router)
            case .favorites:
                FavoritesView(router: router)
            }
        }
    }
}
