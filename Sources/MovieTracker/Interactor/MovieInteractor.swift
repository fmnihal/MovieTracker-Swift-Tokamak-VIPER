import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

protocol MovieInteractorProtocol {
    func fetchPopularMovies() async throws -> [Movie]
}

struct MovieInteractor: MovieInteractorProtocol {
    func fetchPopularMovies() async throws -> [Movie] {
        return [
            Movie(id: 1, title: "Inception", overview: "A mind-bending thriller.", rating: 8.8, releaseDate: "2010-07-16", posterURL: ""),
            Movie(id: 2, title: "Interstellar", overview: "Space exploration adventure.", rating: 8.6, releaseDate: "2014-11-07", posterURL: "")
        ]
    }
}
