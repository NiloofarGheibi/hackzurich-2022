//
//  CardContentView.swift
//  hackzurich
//
//  Created by Niloofar Gheibi on 17.09.22.
//

import SwiftUI


struct User: Hashable, CustomStringConvertible {
    var id: Int
    
    let question: String
    let lastName: String
    let age: Int
    let mutualFriends: Int
    let imageName: String
    let occupation: String
    
    var description: String {
        return "\(question), id: \(id)"
    }
}

struct CardContentView: View {
    /// List of users
    @State var users: [User] = [
        User(id: 0, question: "Cindy", lastName: "Jones", age: 23, mutualFriends: 4, imageName: "person_1", occupation: "Coach"),
        User(id: 1, question: "Mark", lastName: "Bennett", age: 27, mutualFriends: 0, imageName: "person_2", occupation: "Insurance Agent"),
        User(id: 2, question: "Clayton", lastName: "Delaney", age: 20, mutualFriends: 1, imageName: "person_3", occupation: "Food Scientist"),
        User(id: 3, question: "Brittni", lastName: "Watson", age: 19, mutualFriends: 4, imageName: "person_4", occupation: "Historian"),
        User(id: 4, question: "Archie", lastName: "Prater", age: 22, mutualFriends:18, imageName: "person_5", occupation: "Substance Abuse Counselor"),
        User(id: 5, question: "James", lastName: "Braun", age: 24, mutualFriends: 3, imageName: "person_6", occupation: "Marketing Manager"),
        User(id: 6, question: "Danny", lastName: "Savage", age: 25, mutualFriends: 16, imageName: "person_7", occupation: "Dentist"),
        User(id: 7, question: "Chi", lastName: "Pollack", age: 29, mutualFriends: 9, imageName: "person_8", occupation: "Recreational Therapist"),
        User(id: 8, question: "Josue", lastName: "Strange", age: 23, mutualFriends: 5, imageName: "person_9", occupation: "HR Specialist"),
        User(id: 9, question: "Debra", lastName: "Weber", age: 28, mutualFriends: 13, imageName: "person_10", occupation: "Judge")
    ]
    
    /// Return the CardViews width for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(users.count - 1 - id) * 10
        return geometry.size.width - offset
    }
    
    /// Return the CardViews frame offset for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(users.count - 1 - id) * 10
    }
    
    private var maxID: Int {
        return self.users.map { $0.id }.max() ?? 0
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.8945180774, green: 0.04201600701, blue: 0.2176240385, alpha: 1)), Color.init(#colorLiteral(red: 1, green: 0.9882352941, blue: 0.862745098, alpha: 1))]), startPoint: .bottom, endPoint: .top)
                    .frame(width: geometry.size.width * 1.5, height: geometry.size.height)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .offset(x: -geometry.size.width / 4, y: -geometry.size.height / 2)
                
                VStack(spacing: 24) {
                    TitleView()
                    ZStack {
                        ForEach(self.users, id: \.self) { user in
                            Group {
                                // Range Operator
                                if (self.maxID - 3)...self.maxID ~= user.id {
                                    CardView(user: user, onRemove: { removedUser in
                                        // Remove that user from our array
                                        self.users.removeAll { $0.id == removedUser.id }
                                    })
                                        .frame(width: self.getCardWidth(geometry, id: user.id), height: 400)
                                        .offset(x: 0, y: self.getCardOffset(geometry, id: user.id))
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
        }.padding()
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Match it right")
                        .font(.title)
                        .bold()
                    Text("👈 no - yes 👉")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }.padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct CardContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardContentView()
    }
}
