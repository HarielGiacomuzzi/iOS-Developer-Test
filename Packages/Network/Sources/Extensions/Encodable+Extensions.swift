//
//  Encodable+Extensions.swift
//  Network
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//

import Foundation

public extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let encoder = JSONEncoder()
        let data = try encoder.encode(self)
        let object = try JSONSerialization.jsonObject(with: data, options: [])
        guard let dict = object as? [String: Any] else {
            throw NSError(domain: "Invalid JSON structure", code: -1, userInfo: nil)
        }
        return dict
    }
}
