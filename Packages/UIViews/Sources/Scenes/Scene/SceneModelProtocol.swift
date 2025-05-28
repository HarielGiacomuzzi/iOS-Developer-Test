//
//  SceneModelProtocol.swift
//  UIViews
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//

import Network

public protocol SceneModelProtocol {
    var items: [String] { get }
    func fetchItems(completion: @escaping () -> Void)
    var viewTitle: String { get }
}
