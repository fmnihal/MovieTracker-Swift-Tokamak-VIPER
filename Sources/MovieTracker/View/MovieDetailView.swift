import TokamakShim

struct MovieDetailView: View {
    let movieID: Int
    @ObservedObject var router: MovieRouter
    let interactor = MovieInteractor()
    let presenter = MoviePresenter()
    @State private var movie: Movie?

    var body: some View {
        VStack {
            if let movie = movie {
                Text(presenter.present(movie: movie))
                Button("Back") { router.goHome() }
            } else {
                Text("Loading...")
            }
        }
        .task {
            let movies = try! await interactor.fetchPopularMovies()
            movie = movies.first { $0.id == movieID }
        }
    }
}
