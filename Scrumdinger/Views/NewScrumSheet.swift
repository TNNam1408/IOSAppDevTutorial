//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by NamTN on 13/10/25.
//

import Foundation
import SwiftUI


struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]

    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum, saveEdits: { dailyScrum in
                scrums.append(newScrum)
            })
        }
    }
}


#Preview {
    NewScrumSheet(scrums: .constant(DailyScrum.sampleData))
}
