//
//  EmployeeViewController.swift
//  CassCompany
//
//  Created by Cassia Aparecida Barbosa on 24/03/20.
//  Copyright © 2020 CassCompanyTeam. All rights reserved.
//

import Foundation
import UIKit

final class EmployeeViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let viewModel: EmployeeViewModel

    //commit teste

    init(viewModel: EmployeeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self

        tableView.separatorInset = .zero
        
        view.addSubview(tableView)

        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true

        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive  = true
        

        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true


    }

}


extension EmployeeViewController: EmployeeViewModelDelegate {
    func reloadUI() {
        tableView.reloadData()
    }
}

extension EmployeeViewController: UITableViewDelegate {

}

extension EmployeeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = EmployeeCell()
        cell.nameLabel.text = viewModel.name(at: indexPath.row)
        cell.cargoLabel.text = viewModel.cargo(at: indexPath.row)
        cell.photo.image = UIImage(named: viewModel.foto(at: indexPath.row))
        cell.setUpCell()

        return cell
    }


}

