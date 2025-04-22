//
//  BaseRouter.swift
//  Network
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//


import Foundation
import Alamofire
import UIKit

public protocol NetworkRouter: AnyObject {
    associatedtype EndPoint: EndPointType
}

public class BaseRouter<EndPoint: EndPointType>: NetworkRouter {
    lazy var manager: Alamofire.Session = {
        let config = URLSessionConfiguration.default
        config.urlCache = nil
        config.timeoutIntervalForRequest = 60
        return Alamofire.Session(configuration: config)
    }()
    
    public func serverResponseComplete(response: AFDataResponse<Any>, request: DataRequest) {}
}

public extension BaseRouter {
    func request<T: Decodable>(
        _ endpoint: EndPoint,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        let headers = endpoint.headers ?? HTTPHeaders(endpoint.sharedHeader)

        let request: DataRequest

        if let encodableParams = endpoint.parameters {
            let encoder: ParameterEncoder = endpoint.httpMethod == .get
                ? URLEncodedFormParameterEncoder.default
                : JSONParameterEncoder.default

            request = manager.request(
                url,
                method: endpoint.httpMethod,
                parameters: encodableParams,
                encoder: encoder,
                headers: headers
            )
        } else {
            request = manager.request(
                url,
                method: endpoint.httpMethod,
                parameters: nil as [String: String]?,
                encoding: endpoint.encoding,
                headers: headers
            )
        }

        request
            .validate()
            .responseDecodable(of: T.self) { response in
                #if DEBUG
                print("🔄 Result: \(response.result)")
                if let data = response.data,
                   let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                    print("📦 Response JSON: \(json)")
                }
                #endif
                switch response.result {
                case .success(let decoded):
                    completion(.success(decoded))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }


}

