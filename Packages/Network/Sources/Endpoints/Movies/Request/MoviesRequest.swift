//
//  MoviesRequest.swift
//  Network
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//

import Foundation

public struct MoviesRequest: Encodable {
    public let language: String
    
    public init (language: String) {
        self.language = language
    }
}
