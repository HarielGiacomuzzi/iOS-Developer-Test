//
//  MoviesSceneViewModel.swift
//  Developer-Test
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//

import UIViews
import Network
import Foundation

final class MoviesSceneViewModel: MoviesSceneModelProtocol {
    private let networkManager = NetworkManager()
    var movies: [String] = []

    func fetchMovies(completion: @escaping () -> Void) {
        networkManager.tmbdMovies.request(
            MoviesEndPoint.getTrendingMovies(request: .init(language: "pt-BR")),
            responseType: MovieResponse.self
        ) { result in
            switch result {
            case .success(let response):
                self.movies = response.results?.compactMap { $0.title } ?? []
                completion()
            case .failure(let error):
                print("❌ Error fetching movies: \(error)")
                completion()
            }
        }
    }
}
