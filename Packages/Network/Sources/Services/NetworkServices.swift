//
//  NetworkServices.swift
//  Network
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//

import Foundation

public protocol NetworkServices {
    var path: String { get }
}

public enum RWNetworkServices: String, NetworkServices {
    case trendingMovies
    
    public var path: String {
        switch self {
        case .trendingMovies:
            return "/3/trending/movie/day"
        }
    }
}
