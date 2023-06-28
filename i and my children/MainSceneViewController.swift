//
//  ViewController.swift
//  i and my children
//
//  Created by Sergey on 26.06.2023.
//

import UIKit

// MARK: - MainSceneViewController
final class MainSceneViewController: UIViewController {

    private let customPV = CustomPersonView()
    private let personalLabel = UILabel()
    private let childLabel = UILabel()
    private let addChildButton = UIButton()
    private let clearButton = UIButton()
    private let cildTableView = UITableView()
    private enum UiSettings {
        static let backgraundColor: UIColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setting Views
private extension MainSceneViewController {
    func setupView() {
        view.backgroundColor = UiSettings.backgraundColor
        addSubViews()

        setupLayout()
    }
}

//MARK: - Setting
private extension MainSceneViewController {
    func addSubViews() {
        view.addSubview(personalLabel)
        view.addSubview(customPV)
        view.addSubview(childLabel)
        view.addSubview(addChildButton)
    }
}

//MARK: - Layout
private extension MainSceneViewController {
    func setupLayout() {
        personalLabel.translatesAutoresizingMaskIntoConstraints = false
        personalLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        personalLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
        personalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        personalLabel.text = "Персональные данные"



        customPV.translatesAutoresizingMaskIntoConstraints = false
        customPV.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        customPV.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
        customPV.topAnchor.constraint(equalTo: personalLabel.bottomAnchor, constant: 15).isActive = true

    }
}
