//
//  MoviesSceneViewModel.swift
//  Developer-Test
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//

import UIViews
import Network
import Foundation

enum SceneType {
    case movies
    case series

    var endpoint: Endpoints {
        switch self {
        case .movies:
            return Endpoints.getTrendingMovies(request: .init(language: "pt-BR"))
        case .series:
            return Endpoints.getPopularSeries(request: .init(language: "pt-BR"))
        }
    }

    func requestItems(
        with manager: NetworkManager,
        completion: @escaping ([String]) -> Void
    ) {
        switch self {
        case .movies:
            manager.tmbdMovies.request(
                endpoint,
                responseType: MovieResponse.self
            ) { result in
                switch result {
                case .success(let response):
                    completion(response.results?.compactMap { $0.title } ?? [])
                case .failure(let error):
                    print("❌ Error fetching movies: \(error)")
                    completion([])
                }
            }

        case .series:
            manager.tmbdMovies.request(
                endpoint,
                responseType: SeriesResponse.self
            ) { result in
                switch result {
                case .success(let response):
                    completion(response.results?.compactMap { $0.name } ?? [])
                case .failure(let error):
                    print("❌ Error fetching series: \(error)")
                    completion([])
                }
            }
        }
    }
}

final class SceneViewModel: SceneModelProtocol {
    private let networkManager = NetworkManager()
    var items: [String] = []
    
    let scene: SceneType
    init(of type: SceneType) {
        scene = type
    }
    
    var viewTitle: String {
        switch scene {
        case .movies:
            return "Filmes"
        case .series:
            return "Séries"
        }
    }

    func fetchItems(completion: @escaping () -> Void) {
        scene.requestItems(with: networkManager) { [weak self] items in
            self?.items = items
            completion()
        }
    }
}
