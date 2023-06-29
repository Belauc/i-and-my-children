//
//  CustomTableViewCell.swift
//  i and my children
//
//  Created by Sergey on 29.06.2023.
//

import UIKit

//MARK: - CustomTableViewCell
final class CustomTableViewCell: UITableViewCell {
    static let identificator: String = "childCell"
    private let infoStackView = CustomPersonView()
    private let deleteButton = UIButton()
    weak var delegate: CustomCellDelegate?
    var people: peopleModel?

    //MARK: - Intilazers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(people: peopleModel, delegate: CustomCellDelegate) {
        self.people = people
        self.infoStackView.personAgeTF.delegate = delegate
        self.infoStackView.personNameTF.delegate = delegate
        //MARK: - Дописать внесение данных в инпуты и тд
    }

    @objc
    private func didTapButton() {
        delegate?.deleteChild(self)
    }
}

//MARK: - Setting views
private extension CustomTableViewCell {
    func setup() {
        addSubViews()
        setupLayout()
    }
}

//MARK: - Setting
private extension CustomTableViewCell {
    private func addSubViews() {
        contentView.addSubview(infoStackView)
        contentView.addSubview(deleteButton)
    }
}

//MARK: - layout
private extension CustomTableViewCell {
    private func setupLayout() {
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2 + 15).isActive = true
        infoStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        infoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true

        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.leftAnchor.constraint(equalTo: infoStackView.rightAnchor, constant: 15).isActive = true
        deleteButton.topAnchor.constraint(
            equalTo: contentView.topAnchor,
            constant: contentView.frame.height / 3 + 15
        ).isActive = true

        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.setTitleColor(.systemBlue, for: .normal)
        deleteButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        selectionStyle = .none
    }
}
