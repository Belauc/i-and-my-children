//
//  CustomUiViewTF.swift
//  i and my children
//
//  Created by Sergey on 27.06.2023.
//

import UIKit

//MARK: - CustomTextField
final class CustomUiViewTF: UIView {
    let upLabel = UILabel()
    let inputTF = UITextField()

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
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Private methods
    private func setup() {
        setupSubViews()
        setupLayout()
    }

    private func setupSubViews() {
        self.addSubview(upLabel)
        upLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(inputTF)
        inputTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupLayout() {
        layer.cornerRadius = UiSettings.cornerRadius
        layer.borderWidth = UiSettings.borderWidth
        layer.borderColor = UiSettings.borderColor
        upLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: UiSettings.marginLeft).isActive = true
        upLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: UiSettings.marginRight).isActive = true
        upLabel.topAnchor.constraint(equalTo: topAnchor, constant: UiSettings.marginTop).isActive = true

        inputTF.leftAnchor.constraint(equalTo: leftAnchor, constant: UiSettings.marginLeft).isActive = true
        inputTF.rightAnchor.constraint(equalTo: rightAnchor, constant: UiSettings.marginRight).isActive = true
        inputTF.topAnchor.constraint(equalTo: upLabel.bottomAnchor, constant: UiSettings.marginTop).isActive = true
        inputTF.bottomAnchor.constraint(equalTo: bottomAnchor, constant: UiSettings.marginBottom).isActive = true
        inputTF.backgroundColor = .clear
        
    }

}
