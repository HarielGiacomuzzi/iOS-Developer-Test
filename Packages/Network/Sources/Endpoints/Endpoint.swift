//
//  Endpoints.swift
//  Network
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//


import Alamofire
import Foundation

public enum Endpoints {
    case getTrendingMovies(request: Request)
    case getPopularSeries(request: Request)
}

extension Endpoints: EndPointType {
    public var service: NetworkServices {
        switch self {
        case .getTrendingMovies:
            return RWNetworkServices.trendingMovies
        case .getPopularSeries:
            return RWNetworkServices.popularSeries
        }
        
    }
    
    public var path: String {
        switch self {
        case .getTrendingMovies:
            return "/trending/movie/day"
        case .getPopularSeries:
            return "/tv/popular"
        }
    }

    public var parameters: Encodable? {
        switch self {
        case let .getTrendingMovies(request), let .getPopularSeries(request):
            return request
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .getTrendingMovies, .getPopularSeries:
                return .get
        }
    }
    
    public var headers: HTTPHeaders? { nil }
    
    public var encoding: ParameterEncoding {
        switch self {
        case .getTrendingMovies, .getPopularSeries:
                return URLEncoding.default
        }
    }
    
    public var name: String {
        return String(describing: self)
    }
}

