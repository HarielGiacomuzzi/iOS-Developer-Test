//
//  NetworkManager.swift
//  Network
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//

import Foundation
import Alamofire
import UIKit

public protocol RequestParameters: Encodable {}

public protocol EndPointType {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
    var name: String { get }
    var parameters: Encodable? { get }
    var service: NetworkServices { get }
    
    var currentOrigin: String { get }
    var environmentBaseURL: String { get }
    var baseURL: URL { get }
    var sharedHeader: [String: String] { get }
    var fullPath: String { get }
    var allowCleanCookies: Bool { get }
}
