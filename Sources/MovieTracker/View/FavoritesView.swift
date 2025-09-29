import TokamakShim

struct FavoritesView: View {
    @ObservedObject var router: MovieRouter
    @StateObject var userInteractor = UserInteractor()

    var body: some View {
        VStack {
            Text("Favorites").font(.title)
            if let user = userInteractor.currentUser {
                ForEach(user.favorites) { movie in
                    Text(movie.title)
                }
            } else {
                Text("No user logged in")
            }
            Button("Back to Home") { router.goHome() }
        }
    }
}
