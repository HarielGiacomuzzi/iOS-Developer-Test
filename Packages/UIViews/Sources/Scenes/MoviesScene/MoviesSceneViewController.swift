//
//  MoviesSceneViewController.swift
//  UIViews
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//

import UIKit

public final class MoviesSceneViewController: UIViewController {

    private let tableView = UITableView()
    private let viewModel: MoviesSceneModelProtocol

    public init(viewModel: MoviesSceneModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.fetchMovies { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MoviesSceneViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = viewModel.movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") ??
                   UITableViewCell(style: .default, reuseIdentifier: "MovieCell")
        cell.textLabel?.text = movie
        return cell
    }
}
