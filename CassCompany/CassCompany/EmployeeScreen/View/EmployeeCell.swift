//
//  EmployeeCell.swift
//  CassCompany
//
//  Created by Cassia Aparecida Barbosa on 24/03/20.
//  Copyright © 2020 CassCompanyTeam. All rights reserved.
//

import Foundation
import UIKit

final class EmployeeCell: UITableViewCell {

    public lazy var nameLabel: UILabel = {
        let nameLabel = UILabel(frame: .zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()

    public lazy var cargoLabel: UILabel = {
        let cargoLabel = UILabel(frame: .zero)
        cargoLabel.translatesAutoresizingMaskIntoConstraints = false
        return cargoLabel
    }()

    public lazy var photo: UIImageView = {
        let photo = UIImageView(frame: .zero)
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    func setUpCell() {
        
        cargoLabel.textAlignment  = .right
        
        self.addSubview(nameLabel)
        self.addSubview(cargoLabel)
        self.addSubview(photo)

        photo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        photo.widthAnchor.constraint(equalToConstant: 40).isActive = true
        photo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        nameLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        cargoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        cargoLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        cargoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        


    }
}
