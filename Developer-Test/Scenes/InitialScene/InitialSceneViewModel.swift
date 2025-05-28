//
//  InitialSceneViewModel.swift
//  Developer-Test
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//

import UIViews
import UIKit

final class InitialSceneViewModel: InitialSceneModelProtocol {
    func didTapMoviesButton(context: UIViewController) {
        let viewModel = SceneViewModel(of: .movies)
        let controller = SceneViewController(viewModel: viewModel)
        let navController = UINavigationController(rootViewController: controller)
        
        context.present(navController, animated: true)
    }
    
    func didTapTVButton(context: UIViewController) {
        let viewModel = SceneViewModel(of: .series)
        let controller = SceneViewController(viewModel: viewModel)
        let navController = UINavigationController(rootViewController: controller)
        
        context.present(navController, animated: true)
    }
}
