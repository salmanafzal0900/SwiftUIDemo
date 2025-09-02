//
//  swiftUIDemoApp.swift
//  swiftUIDemo
//
//  Created by Salman Afzal on 16/04/2025.
//

import SwiftUI
import SwiftData

@main
struct swiftUIDemoApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    
    var user = User(name: "test", luyckyNumber: 0)
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            SignUpView(viewModel: SignUpVM())
            PropertyWraperView().environmentObject(user)
        }
        .modelContainer(sharedModelContainer)
    }
}
