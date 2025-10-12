//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Tran Nhat Nam on 11/10/25.
//

import SwiftData
import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(
                for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
        .modelContainer(sharedModelContainer)
    }
}
