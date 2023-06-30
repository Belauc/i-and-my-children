//
//  PeopleModel.swift
//  i and my children
//
//  Created by Sergey on 29.06.2023.
//

import Foundation

struct PeopleModel {
    let id = UUID()
    var name: String?
    var age: String?

    init(name: String, age: String) {
        self.name = name
        self.age = age
    }

    init() {
        self.name = nil
        self.age = nil
    }
}

enum TypeProperty {
    case name, age
}
