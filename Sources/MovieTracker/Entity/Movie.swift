struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let overview: String
    let rating: Double
    let releaseDate: String
    let posterURL: String
}
