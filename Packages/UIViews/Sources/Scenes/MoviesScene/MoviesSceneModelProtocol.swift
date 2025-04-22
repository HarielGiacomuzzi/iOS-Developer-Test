//
//  MoviesSceneModelProtocol.swift
//  UIViews
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//

import Network

public protocol MoviesSceneModelProtocol {
    var movies: [String] { get }
    func fetchMovies(completion: @escaping () -> Void)
}
