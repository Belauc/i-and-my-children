//
//  ViewController.swift
//  i and my children
//
//  Created by Sergey on 26.06.2023.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func deleteChild(_ cell: CustomTableViewCell)
    func changePeopleInfo(for child: PeopleModel)
}

// MARK: - MainSceneViewController
final class MainSceneViewController: UIViewController {

    private let customPV = CustomPersonView()
    private let personalLabel = UILabel()
    private let middleStackView = UIStackView()
    private let childLabel = UILabel()
    private var addChildButton = UIButton()
    private var clearButton = UIButton()
    private let childTableView = UITableView()
    private var childrenParent: PeopleModel = PeopleModel()
    private var childs: [PeopleModel] = []
    private enum UiSettings {
        static let backgraundColor: UIColor = .white
        static let marginLeft: CGFloat = 16
        static let marginTop: CGFloat = 10
        static let marginRight: CGFloat = -16
        static let marginBottom: CGFloat = -15
        static let btnInsets: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 15.0, leading: 18.0, bottom: 15.0, trailing: 18.0)
        static let textDeleteButton: String = "Удалить"
        static let textChildLabel: String = "Дети (макс. 5)"
        static let addButtonColor: UIColor = .systemBlue
        static let clearButtonColor: UIColor = .red
        static let btnStrokeWidth: CGFloat = 2.5
        static let btnImage: UIImage = UIImage(systemName: "plus")!
        static let addBtnTitle: String = "Добавить ребенка"
        static let clearBtnTitle: String = "Очистить"
        static let spacingStackView: CGFloat = 10.0
        static let maximumChilds: Int = 5
        static let titleAlertCheck: String = "Внимание"
        static let messageAlertCheck: String = "Все внесенные данные удаляться"
        static let titleAlertAcceptButton: String = "Сбросить данные"
        static let titleAlertCancelButton: String = "Отмена"
        static let personalLabelText: String = "Персональные данные"
    }
    private enum TypeButton {
        case add, clear
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @objc
    private func addNewChild() {
        childs.append(PeopleModel())
        switch childs.count {
            case UiSettings.maximumChilds:
                addChildButton.isHidden = true
            case 0...:
                clearButton.isHidden = false
            default:
                return
        }
        childTableView.reloadData()
    }

    @objc
    private func deleteAllChildsAction() {
        showAlertDeleteAllChilds()
    }

    //MARK: - Alet for delete all childs
    private func showAlertDeleteAllChilds() {
        let alert = UIAlertController(title: UiSettings.titleAlertCheck,
                                      message: UiSettings.messageAlertCheck,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: UiSettings.titleAlertAcceptButton, style: .default, handler: deleteAllChilds))
        alert.addAction(UIAlertAction(title: UiSettings.titleAlertCancelButton, style: .cancel, handler: nil))
        present(alert, animated: true)
    }

    private func deleteAllChilds(alert: UIAlertAction) {
        childs.removeAll()
        childrenParent = PeopleModel()
        customPV.configure(model: childrenParent, delegate: nil)
        childTableView.reloadData()
        clearButton.isHidden = true
    }
}

//MARK: - Setting Views
private extension MainSceneViewController {
    func setupView() {
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
        view.addSubview(clearButton)
        view.addSubview(childTableView)

    }
}

//MARK: - Layout
private extension MainSceneViewController {
    func setupLayout() {
        view.backgroundColor = UiSettings.backgraundColor

        personalLabel.translatesAutoresizingMaskIntoConstraints = false
        personalLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: UiSettings.marginLeft).isActive = true
        personalLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: UiSettings.marginRight).isActive = true
        personalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UiSettings.marginTop).isActive = true
        personalLabel.text = UiSettings.personalLabelText

        customPV.translatesAutoresizingMaskIntoConstraints = false
        customPV.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: UiSettings.marginLeft).isActive = true
        customPV.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: UiSettings.marginRight).isActive = true
        customPV.topAnchor.constraint(equalTo: personalLabel.bottomAnchor, constant: UiSettings.marginTop).isActive = true
        customPV.configure(model: childrenParent, delegate: self)

        middleStackView.translatesAutoresizingMaskIntoConstraints = false
        middleStackView.axis = .horizontal
        middleStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: UiSettings.marginLeft).isActive = true
        middleStackView.topAnchor.constraint(equalTo: customPV.bottomAnchor, constant: UiSettings.marginTop).isActive = true
        middleStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: UiSettings.marginRight).isActive = true

        childLabel.translatesAutoresizingMaskIntoConstraints = false
        childLabel.leftAnchor.constraint(equalTo: middleStackView.leftAnchor).isActive = true
        childLabel.text = UiSettings.textChildLabel

        addChildButton.translatesAutoresizingMaskIntoConstraints = false
        addChildButton.configuration = getCustomButtonConfig(.add)
        addChildButton.setTitle(UiSettings.addBtnTitle, for: .normal)
        addChildButton.setTitleColor(UiSettings.addButtonColor, for: .normal)
        addChildButton.rightAnchor.constraint(equalTo: middleStackView.rightAnchor).isActive = true
        addChildButton.addTarget(self, action: #selector(addNewChild), for: .touchUpInside)

        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.configuration = getCustomButtonConfig(.clear)
        clearButton.setTitle(UiSettings.clearBtnTitle, for: .normal)
        clearButton.setTitleColor(UiSettings.clearButtonColor, for: .normal)
        clearButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: UiSettings.marginLeft).isActive = true
        clearButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: UiSettings.marginRight).isActive = true
        clearButton.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
            constant: UiSettings.marginBottom
        ).isActive = true
        clearButton.addTarget(self, action: #selector(deleteAllChildsAction), for: .touchUpInside)
        clearButton.isHidden = true

        childTableView.translatesAutoresizingMaskIntoConstraints = false
        childTableView.topAnchor.constraint(equalTo: middleStackView.bottomAnchor, constant: UiSettings.marginTop).isActive = true
        childTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: UiSettings.marginLeft).isActive = true
        childTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: UiSettings.marginRight).isActive = true
        childTableView.bottomAnchor.constraint(equalTo: clearButton.topAnchor, constant: UiSettings.marginBottom).isActive = true
        childTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identificator)
        childTableView.dataSource = self
    }

    //MARK: - Setup Custom Config Button
    private func getCustomButtonConfig(_ type: TypeButton) -> UIButton.Configuration {
        var btnConfig = UIButton.Configuration.borderless()
        btnConfig.contentInsets = UiSettings.btnInsets
        btnConfig.background.strokeWidth = UiSettings.btnStrokeWidth
        btnConfig.cornerStyle = .capsule
        if type == .add {
            btnConfig.image = UiSettings.btnImage
            btnConfig.background.strokeColor = UiSettings.addButtonColor
        } else {
            btnConfig.background.strokeColor = UiSettings.clearButtonColor
        }
        return btnConfig
    }
}

//MARK: - Delegate CellTableView
extension MainSceneViewController: CustomCellDelegate {
    func changePeopleInfo(for people: PeopleModel) {
        if let index = childs.firstIndex(where: { $0.id == people.id }) {
            childs[index] = people
            childTableView.reloadData()
        } else if childrenParent.id == people.id {
            childrenParent = people
        }
    }

    func deleteChild(_ cell: CustomTableViewCell) {
        guard let indexPath = childTableView.indexPath(for: cell) else { return }
        childs.remove(at: indexPath.row)
        childTableView.reloadData()
        switch childs.count {
            case 1..<UiSettings.maximumChilds:
                addChildButton.isHidden = false
            case 0:
                clearButton.isHidden = true
            default:
                return
        }
    }
}

//MARK: - Extention for table view
extension MainSceneViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identificator, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        cell.configure(people: childs[indexPath.row], delegate: self)
        cell.delegate = self
        return cell
    }
}
