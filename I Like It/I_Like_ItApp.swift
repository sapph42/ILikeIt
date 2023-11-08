//
//  I_Like_ItApp.swift
//  I Like It
//
//  Created by Nick Gibson on 11/7/23.
//

import SwiftUI
import SwiftData

@main
struct I_Like_ItApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            save("data.json", item: items)
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ItemList()
        }
        .modelContainer(sharedModelContainer)
    }
}
