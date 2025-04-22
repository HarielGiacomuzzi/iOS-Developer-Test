//
//  MoviesResponse.swift
//  Network
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//

import Foundation

public struct MovieResponse: Decodable {
    public let page: Int?
    public let results: [Movie]?
    public let totalPages: Int?
    public let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

public struct Movie: Decodable {
    let backdropPath: String?
    let id: Int?
    public let title: String?
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let mediaType: String?
    let adult: Bool?
    let originalLanguage: String?
    let genreIds: [Int]?
    let popularity: Double?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case title
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case adult
        case originalLanguage = "original_language"
        case genreIds = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
