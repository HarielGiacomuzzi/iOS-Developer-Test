//
//  MoviesEndpoint.swift
//  Network
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//


import Alamofire
import Foundation

public enum MoviesEndPoint {
    case getTrendingMovies(request: MoviesRequest)
}

extension MoviesEndPoint: EndPointType {
    public var service: NetworkServices {
        return RWNetworkServices.trendingMovies
    }
    
    public var path: String {
        switch self {
        case .getTrendingMovies:
            return "/trending/movie/day"
        }
    }

    public var parameters: Encodable? {
        switch self {
        case let .getTrendingMovies(request):
            return request
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
            case .getTrendingMovies:
                return .get
        }
    }
    
    public var headers: HTTPHeaders? { nil }
    
    public var encoding: ParameterEncoding {
        switch self {
            case .getTrendingMovies:
                return URLEncoding.default
        }
    }
    
    public var name: String {
        return String(describing: self)
    }
}

