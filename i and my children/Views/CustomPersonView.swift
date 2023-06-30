//
//  CustomTextField.swift
//  i and my children
//
//  Created by Sergey on 26.06.2023.
//

import UIKit

//MARK: - CustomTextField
final class CustomPersonView: UIStackView {

    private let personNameTF = CustomUiViewTF(typeProperty: .name, model: PeopleModel())
    private let personAgeTF = CustomUiViewTF(typeProperty: .age, model: PeopleModel())
    private enum UiSettings {
        static let spacingStackView: CGFloat = 10.0
    }

    //MARK: - Initializers
    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Private methods
    private func setup() {
        setupSubViews()
        setupLayout()
    }

    private func setupSubViews() {
        addArrangedSubview(personNameTF)
        personNameTF.translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(personAgeTF)
        personAgeTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupLayout() {
        personNameTF.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        personNameTF.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        personAgeTF.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        personAgeTF.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        spacing = UiSettings.spacingStackView
        axis = .vertical

    }

    func configure(model: PeopleModel, delegate: CustomCellDelegate?) {
        personNameTF.configure(model: model, delegate: delegate)
        personAgeTF.configure(model: model, delegate: delegate)
    }
}
