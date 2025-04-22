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
        button.setTitle("Lista de Filmes", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleGoToMoviesList), for: .touchUpInside)
        return button
    }()
    
    private lazy var seriesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Lista de Séries", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleGoToSeriesList), for: .touchUpInside)
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
        // Do any additional setup after loading the view.
        
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

