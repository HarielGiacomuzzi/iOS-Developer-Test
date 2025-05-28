//
//  InitialSceneViewController.swift
//  UIViews
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//

import UIKit

public class InitialViewController: UIViewController {
    
    private var viewModel: InitialSceneModelProtocol
    
    private lazy var moviesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(.moviesButtonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleGoToMoviesList), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        return button
    }()

    private lazy var seriesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(.seriesButtonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 12
        button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleGoToSeriesList), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        return button
    }()
    
    public init(viewModel: InitialSceneModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayout()
    }

    func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(moviesButton)
        view.addSubview(seriesButton)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            moviesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moviesButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            seriesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            seriesButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50)
        ])
    }
    
    @objc func handleGoToMoviesList() {
        viewModel.didTapMoviesButton(context: self)
    }
    
    @objc func handleGoToSeriesList() {
        viewModel.didTapTVButton(context: self)
    }
}

private extension String {
    static let moviesButtonTitle = "Lista de Filmes"
    static let seriesButtonTitle = "Lista de Séries"
}
