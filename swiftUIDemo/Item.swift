//
//  Item.swift
//  swiftUIDemo
//
//  Created by Salman Afzal on 16/04/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
