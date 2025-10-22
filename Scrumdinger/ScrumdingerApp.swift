//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Tran Nhat Nam on 11/10/25.
//

import SwiftUI
import SwiftData


@main
struct ScrumdingerApp: App {


    var body: some Scene {
        WindowGroup {
            ScrumsView()
        }
        .modelContainer(for: DailyScrum.self)
    }
}
