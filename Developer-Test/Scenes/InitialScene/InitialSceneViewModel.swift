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
        let viewModel = MoviesSceneViewModel()
        let controller = MoviesSceneViewController(viewModel: viewModel)
        
        context.present(controller, animated: true)
    }
    
    func didTapTVButton(context: UIViewController) {
        // TODO: Adicionar lógica para navegação para tela de Séries
    }
}
