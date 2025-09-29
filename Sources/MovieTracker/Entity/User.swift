struct User: Codable {
    let username: String
    let password: String
    var favorites: [Movie] = []
}
