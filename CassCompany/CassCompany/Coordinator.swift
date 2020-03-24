//
//  Coordinator.swift
//  CassCompany
//
//  Created by Cassia Aparecida Barbosa on 24/03/20.
//  Copyright © 2020 CassCompanyTeam. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    func start()
    
}
