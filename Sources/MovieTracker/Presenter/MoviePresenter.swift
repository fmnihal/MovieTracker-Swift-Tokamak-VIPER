struct MoviePresenter {
    func present(movie: Movie) -> String {
        return "\(movie.title) (\(movie.releaseDate))\nRating: \(movie.rating)\n\n\(movie.overview)"
    }
}
