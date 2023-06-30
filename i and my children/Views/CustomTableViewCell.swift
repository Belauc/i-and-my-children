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
    private enum UiSettings {
        static let marginLeft: CGFloat = 16
        static let marginTop: CGFloat = 10
        static let marginBottom: CGFloat = -16
        static let textDeleteButton: String = "Удалить"
        static let buttonColor: UIColor = UIColor.systemBlue
        static let spacingStackView: CGFloat = 10.0
    }

    //MARK: - Intilazers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(people: PeopleModel, delegate: CustomCellDelegate) {
        self.infoStackView.configure(model: people, delegate: delegate)
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
        infoStackView.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2 + UiSettings.marginLeft).isActive = true
        infoStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: UiSettings.marginBottom).isActive = true
        infoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UiSettings.marginTop).isActive = true

        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.leftAnchor.constraint(equalTo: infoStackView.rightAnchor, constant: UiSettings.marginLeft).isActive = true
        deleteButton.topAnchor.constraint(
            equalTo: contentView.topAnchor,
            constant: contentView.frame.height / 3 + UiSettings.marginTop
        ).isActive = true

        deleteButton.setTitle(UiSettings.textDeleteButton, for: .normal)
        deleteButton.setTitleColor(UiSettings.buttonColor, for: .normal)
        deleteButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        selectionStyle = .none
    }
}
