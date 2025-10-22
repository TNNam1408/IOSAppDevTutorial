////
////  DailyScrum.swift
////  Scrumdinger
////
////  Created by Tran Nhat Nam on 11/10/25.
////
//
//import Foundation
//import ThemeKit
//import SwiftData
//
//@Model
//class DailyScrum: Identifiable {
//    var id: UUID
//    var title: String
//    var attendees: [Attendee]
//    var lengthInMinutes: Int
//    var lengthInMinutesAsDouble: Double {
//        get {
//            Double(lengthInMinutes)
//        }
//        set {
//            lengthInMinutes = Int(newValue)
//        }
//    }
//    var theme: Theme
//    var history: [History] = []
//
//    init(
//        id: UUID = UUID(), title: String, attendees: [String],
//        lengthInMinutes: Int, theme: Theme
//    ) {
//        self.id = id
//        self.title = title
//        self.attendees = attendees.map { Attendee(name: $0) }
//        self.lengthInMinutes = lengthInMinutes
//        self.theme = theme
//    }
//}
//
//extension DailyScrum {
//    struct Attendee: Identifiable {
//        let id: UUID
//        var name: String
//
//        init(id: UUID = UUID(), name: String) {
//            self.id = id
//            self.name = name
//        }
//    }
//
//    static var emptyScrum: DailyScrum {
//        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
//    }
//}
//

import Foundation
import ThemeKit
import SwiftData


@Model
class DailyScrum: Identifiable {
    var id: UUID
    var title: String

    @Relationship(deleteRule: .cascade, inverse: \Attendee.dailyScrum)
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme

    @Relationship(deleteRule: .cascade, inverse: \History.dailyScrum)
    var history: [History] = []

    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(
            title: "Design",
            attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
            lengthInMinutes: 10,
            theme: .yellow),
        DailyScrum(
            title: "App Dev",
            attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
            lengthInMinutes: 5,
            theme: .orange),
        DailyScrum(
            title: "Web Dev",
            attendees: [
                "Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey",
                "Aga", "Chad", "Jenn", "Sarah",
            ],
            lengthInMinutes: 5,
            theme: .poppy),
    ]
}
