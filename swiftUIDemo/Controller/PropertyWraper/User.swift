//
//  User.swift
//  swiftUIDemo
//
//  Created by Salman Afzal on 02/09/2025.
//

import Foundation

class User :ObservableObject{
    
    internal init(name: String, luyckyNumber: Int) {
        self.name = name
        self.luyckyNumber = luyckyNumber
    }
    
    var name: String
    @Published var luyckyNumber:Int
    
}

