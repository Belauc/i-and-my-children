//
//  ViewController.swift
//  i and my children
//
//  Created by Sergey on 26.06.2023.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func deleteChild(_ cell: CustomTableViewCell)
    func changePeopleInfo()
}

// MARK: - MainSceneViewController
final class MainSceneViewController: UIViewController {

    private let customPV = CustomPersonView()
    private let personalLabel = UILabel()
    private let middleStackView = UIStackView()
    private let childLabel = UILabel()
    private let addChildButton = UIButton()
    private let clearButton = UIButton()
    private let childTableView = UITableView()
    private var childrenParent: peopleModel = peopleModel()
    private var childs: [peopleModel] = []
    private enum UiSettings {
        static let backgraundColor: UIColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: - Update constrate for adaptive buttons
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //addChildButton.layer.cornerRadius = addChildButton.frame.size.height / 2
    }

    @objc
    private func addNewChild() {
        childs.append(peopleModel())
        childTableView.reloadData()
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
        view.addSubview(middleStackView)
        middleStackView.addArrangedSubview(childLabel)
        middleStackView.addArrangedSubview(addChildButton)
        view.addSubview(childTableView)
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

        middleStackView.translatesAutoresizingMaskIntoConstraints = false
        middleStackView.axis = .horizontal
        middleStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        middleStackView.topAnchor.constraint(equalTo: customPV.bottomAnchor, constant: 15).isActive = true
        middleStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true


        childLabel.translatesAutoresizingMaskIntoConstraints = false
        childLabel.leftAnchor.constraint(equalTo: middleStackView.leftAnchor).isActive = true
        childLabel.text = "Дети (макс. 5)"

        addChildButton.translatesAutoresizingMaskIntoConstraints = false
        var btnConfig = UIButton.Configuration.borderless()
        btnConfig.contentInsets = NSDirectionalEdgeInsets(top: 15.0, leading: 18.0, bottom: 15.0, trailing: 18.0)
        btnConfig.background.strokeWidth = 2.5
        btnConfig.background.strokeColor = .systemBlue
        btnConfig.cornerStyle = .capsule
        btnConfig.image = UIImage(systemName: "plus")
        addChildButton.configuration = btnConfig
        addChildButton.rightAnchor.constraint(equalTo: middleStackView.rightAnchor).isActive = true
        addChildButton.setTitle("Добавить ребенка", for: .normal)
        addChildButton.setTitleColor(.systemBlue, for: .normal)
        addChildButton.layer.borderColor = UIColor.blue.cgColor
        addChildButton.addTarget(self, action: #selector(addNewChild), for: .touchUpInside)

        childTableView.translatesAutoresizingMaskIntoConstraints = false
        childTableView.topAnchor.constraint(equalTo: middleStackView.bottomAnchor, constant: 15).isActive = true
        childTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        childTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
        childTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        childTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identificator)
        childTableView.dataSource = self
    }

}

extension MainSceneViewController: CustomCellDelegate {
    func changePeopleInfo() {

    }

    func deleteChild(_ cell: CustomTableViewCell) {
        print("hello its button delete")
    }
}

//MARK: - Extention for table view
extension MainSceneViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identificator, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        return cell
    }
}
