//
//  CustomTextField.swift
//  i and my children
//
//  Created by Sergey on 26.06.2023.
//

import UIKit

//MARK: - CustomTextField
final class CustomPersonView: UIStackView {

    let personNameTF = CustomUiViewTF()
    let personAgeTF = CustomUiViewTF()
    private enum UiSettings {
        static let marginLeft: CGFloat = 16
        static let marginTop: CGFloat = 10
        static let marginRight: CGFloat = -16
        static let marginBottom: CGFloat = -10
        static let cornerRadius: CGFloat = 10
        static let borderWidth: CGFloat = 2.0
        static let borderColor: CGColor = UIColor.systemGray6.cgColor
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
        personNameTF.upLabel.text = "Имя"
        addArrangedSubview(personAgeTF)
        personAgeTF.translatesAutoresizingMaskIntoConstraints = false
        personAgeTF.upLabel.text = "Возраст"
    }

    private func setupLayout() {
        personNameTF.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        personNameTF.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        //personNameTF.topAnchor.constraint(equalTo: topAnchor).isActive = true

        personAgeTF.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        personAgeTF.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        spacing = 10
        axis = .vertical

    }
}
