//
//  SceneViewController.swift
//  UIViews
//
//  Created by Hariel Giacomuzzi Dias on 08/04/25.
//

import UIKit

public final class SceneViewController: UIViewController {

    private let tableView = UITableView()
    private let activityIndicator = UIActivityIndicatorView(style: .gray)
    
    private let viewModel: SceneModelProtocol

    public init(viewModel: SceneModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.viewTitle
        
        setupTableView()
        setupActivityIndicator()
        activityIndicator.startAnimating()
        
        viewModel.fetchItems { [weak self] in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
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
    
    private func setupActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension SceneViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = viewModel.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") ??
                   UITableViewCell(style: .default, reuseIdentifier: "MovieCell")
        cell.textLabel?.text = movie
        return cell
    }
}
