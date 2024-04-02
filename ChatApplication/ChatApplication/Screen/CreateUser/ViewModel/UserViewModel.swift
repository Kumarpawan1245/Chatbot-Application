//
//  ViewModel.swift
//  ChatApplication
//
//  Created by neosoft on 01/04/24.

import Foundation

class NameInputViewModel {
    var names: [String] = []
    var userName: String = ""
    
    func addUser(name: String) {
        if !names.contains(name) {
            names.insert(name, at:0)
        }
    }

    func checkUserExistence(name: String) -> Bool {
        return names.contains(name)
    }
}
