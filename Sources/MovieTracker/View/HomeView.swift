import TokamakShim

struct HomeView: View {
    @ObservedObject var router: MovieRouter
    let interactor = MovieInteractor()
    let presenter = MoviePresenter()
    @State private var movies: [Movie] = []

    var body: some View {
        VStack {
            Text("Popular Movies").font(.title)
            ForEach(movies) { movie in
                VStack {
                    Text(presenter.present(movie: movie))
                    Button("View Details") {
                        router.goToDetail(movieID: movie.id)
                    }
                }
                .padding()
            }
            Button("Go to Favorites") { router.goToFavorites() }
            Button("Profile") { router.goProfile() }
        }
        .task {
            movies = try! await interactor.fetchPopularMovies()
        }
    }
}
