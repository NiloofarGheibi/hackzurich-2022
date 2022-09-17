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
        let image: String
        let id = UUID()
    }
    
    struct LeaderSection: Identifiable {
        let name: String
        let leaders: [Leader]
        let id = UUID()
    }
    
    struct LeadView : View {
        var leader : Leader
        
        var body : some View {
            ZStack {
                HStack {
                    Image(leader.image)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(50)
                    
                    Spacer(minLength: 10)
                    
                    VStack(alignment: .leading, spacing: 22) {
                        
                        Text(leader.name)
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(String(leader.score))
                            .foregroundColor(.red)
                    }
                    
                    Spacer(minLength: 10)
                }
                .padding()
            }
            .cornerRadius(10)
            .frame(width: 350)
            .background(.secondary)
        }
        
    }
    
    private let oceanRegions: [LeaderSection] = [
        LeaderSection(name: "Top 5 Players 🚀",
                      leaders: [Leader(name: "Alex", score: Int.random(in: 0..<204324), image: "alex"),
                                Leader(name: "You", score: Int.random(in: 0..<19999), image: "you"),
                                Leader(name: "Josh", score: Int.random(in: 0..<10209), image: "josh"),
                                Leader(name: "Julia", score: Int.random(in: 0..<965), image: "julia"),
                                Leader(name: "Jane", score: Int.random(in: 0..<490), image: "jane")
                               ])]
    
    @State private var singleSelection: UUID?
    
    var body: some View {
        VStack {
                ForEach(oceanRegions) { region in
                    ForEach(region.leaders) { lead in
                        LeadView(leader: lead)
                    }
                }
        }.background(Image("bg_guess").ignoresSafeArea(.all, edges: .all)).scaledToFill()
    }
}



struct LeaderPageView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderPageView()
    }
}
