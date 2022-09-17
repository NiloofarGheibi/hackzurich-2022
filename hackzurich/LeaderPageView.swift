//
//  LeaderPageView.swift
//  hackzurich
//
//  Created by Niloofar Gheibi on 17.09.22.
//

import SwiftUI

struct LeaderPageView: View {
    struct Leader: Hashable, Identifiable {
            let name: String
            let score: Int
            let id = UUID()
        }

        struct LeaderSection: Identifiable {
            let name: String
            let seas: [Leader]
            let id = UUID()
        }

        private let oceanRegions: [LeaderSection] = [
            LeaderSection(name: "Top 5 Players 🚀",
                        seas: [Leader(name: "John", score: Int.random(in: 0..<60)),
                               Leader(name: "Jane", score: Int.random(in: 0..<23)),
                               Leader(name: "Julia", score: Int.random(in: 0..<24324)),
                               Leader(name: "Josh", score: Int.random(in: 0..<124))]),
            LeaderSection(name: "Game Changers 🎯",
                        seas: [Leader(name: "Jim", score: 1)]),
            LeaderSection(name: "New Joiners 👯‍♂️",
                        seas: [Leader(name: "Jack", score: Int.random(in: 0..<78883)),
                               Leader(name: "Jose", score: Int.random(in: 0..<65)),
                               Leader(name: "Jenny", score: Int.random(in: 0..<3))]),
        ]

        @State private var singleSelection: UUID?

    var body: some View {
        ZStack{
            List(selection: $singleSelection) {
                ForEach(oceanRegions) { region in
                    Section(header: Text(region.name)) {
                        ForEach(region.seas) { sea in
                            Text(sea.name + "->" + String(sea.score))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                        }
                    }
                }
            }
        }
    }
}

struct LeaderPageView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderPageView()
    }
}
