//
//  PeopleModel.swift
//  i and my children
//
//  Created by Sergey on 29.06.2023.
//

import Foundation

class peopleModel {
    var name: String?
    var age: Int?

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    init() {
        self.name = nil
        self.age = nil
    }
}
