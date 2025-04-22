//
//  EndpointType.swift
//  Network
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//

import Foundation
import Alamofire
import UIKit

public extension EndPointType {
    
    var currentOrigin: String {
        return "https://api.themoviedb.org"
    }

    /// Apenas o host + versão
    var environmentBaseURL: String {
        return currentOrigin + "/3"
    }

    /// Base + path sem duplicar
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }

    /// Headers com token do Info.plist
    var sharedHeader: [String: String] {
        var headers: [String: String] = [:]

        if let token = Bundle.main.infoDictionary?["TMDBBearerToken"] as? String {
            headers["Authorization"] = "Bearer \(token)"
        } else {
            assertionFailure("❌ TMDBBearerToken not found in Info.plist")
        }

        headers["accept"] = "application/json"
        return headers
    }

    /// URL final com query params (caso necessário)
    var fullPath: String {
        var url = baseURL.appendingPathComponent(self.path).absoluteString

        if let parameters = parameters,
           let urlParameters = try? parameters.asDictionary(),
           !urlParameters.isEmpty,
           var urlComps = URLComponents(string: url),
           encoding is URLEncoding {
            
            let queryString = urlParameters
                .map { "\($0.key)=\("\($0.value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")" }
                .joined(separator: "&")

            let existingQuery = urlComps.percentEncodedQuery.map { $0 + "&" } ?? ""
            urlComps.percentEncodedQuery = existingQuery + queryString
            url = urlComps.url?.absoluteString ?? url
        }

        return url
    }

    var allowCleanCookies: Bool {
        return true
    }
}
