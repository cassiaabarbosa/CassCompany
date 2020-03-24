//
//  LoginViewController.swift
//  CassCompany
//
//  Created by Cassia Aparecida Barbosa on 24/03/20.
//  Copyright © 2020 CassCompanyTeam. All rights reserved.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController {

    private lazy var loginLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()

    private lazy var passwordLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var loginTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var passwordTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var loginButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let viewModel: LoginViewModel


    init(viewModel: LoginViewModel ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.delegate = self

        loginLabel.text = "Usuário"
        loginLabel.textAlignment = .center
        loginLabel.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        loginLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        loginLabel.layer.cornerRadius = 10
        loginLabel.layer.masksToBounds = true
        
        passwordLabel.text = "Senha"
        passwordLabel.textAlignment = .center
        passwordLabel.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        passwordLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        passwordLabel.layer.cornerRadius = 10
        passwordLabel.layer.masksToBounds = true

        loginTextField.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 0.25)
        loginTextField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        loginTextField.placeholder = "Digite o usuário..."
        loginTextField.textAlignment = .center
        loginTextField.autocapitalizationType = .none
        loginTextField.layer.cornerRadius = 10

        passwordTextField.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 0.25)
        passwordTextField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        passwordTextField.placeholder = "Digite a senha..."
        passwordTextField.textAlignment = .center
        passwordTextField.autocapitalizationType = .none
        passwordTextField.layer.cornerRadius = 10

        loginButton.setTitle("Acessar", for: .normal)
        loginButton.backgroundColor = .red
        loginButton.addTarget(self, action: #selector(login), for: .touchDown)

        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        loginLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -100).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        loginLabel.trailingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor, constant: -10).isActive = true
        loginLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        loginTextField.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -100).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: self.loginLabel.trailingAnchor, constant: 10).isActive = true
        loginTextField.widthAnchor.constraint(equalTo:self.loginLabel.widthAnchor).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        
        passwordLabel.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 30).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        passwordLabel.trailingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor, constant: -10).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

        
        
        passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 30).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: self.loginLabel.trailingAnchor, constant: 10).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo:self.loginLabel.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        
        loginButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true

    }

    @objc private func login() {
        viewModel.login = loginTextField.text ?? ""
        viewModel.password = passwordTextField.text ?? ""
        viewModel.presentEmployeesScreen()
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func reject() {
        print("Login rejeitado!")
    }


}
