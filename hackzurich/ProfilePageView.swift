//
//  ProfileView.swift
//  hackzurich
//
//  Created by Rocha, Isabelly on 17.09.22.
//

import SwiftUI

struct ProfilePageView: View {
    var body: some View {
        NavigationView {

            Home()
                .navigationTitle("")
                .navigationBarHidden(true)
        }
    }
}

struct Home : View {
    @State var tab = "MarketPlace"
    @Namespace var animation
    
    var body: some View {

        VStack {

            HStack {
                Button(action: {}) {
                    Text("Balance")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Image("coin")
                        //.renderingMode(.template)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                    Text("18,600")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .foregroundColor(.white.opacity(0.5))
                
                Spacer(minLength: 0)
                
                Button(action: {}) {
                    Image("bell")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            HStack(spacing: 0) {
                TabButton(selected: $tab, title: "MarketPlace", animation: animation)
                TabButton(selected: $tab, title: "Donation", animation: animation)

            }
            .background(Color.white.opacity(0.08))
            .clipShape(Capsule())
            .padding(.horizontal)
            
            Dashboard(selected: $tab)
            
            Spacer()
            
        }
        .background(Image("bg_profile").ignoresSafeArea(.all, edges: .all)).scaledToFill()
        
    }
}

struct Dashboard : View {
    @Binding var selected : String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if (selected == "MarketPlace") {
                    ProductView(sales:marketplaceData[0])
                    ProductView(sales:marketplaceData[1])
                    ProductView(sales:marketplaceData[2])
                    ProductView(sales:marketplaceData[3])
                } else {
                    ProductView(sales:donationData[0])
                    ProductView(sales:donationData[1])
                }

            }
        }
        .padding()
    }
}

struct TabButton: View {
    @Binding var selected : String
    var title : String
    var animation : Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selected = title
            }
        }) {
            ZStack {
                Capsule()
                    .fill(Color.clear)
                    .frame(height: 45)
                
                if selected == title {
                    Capsule()
                        .fill(Color.white)
                        .frame(height: 45)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                }
                
                Text(title)
                    .foregroundColor(selected == title ? .black : .white)
                    .fontWeight(.bold)
            }
        }
    }
}

struct Sales : Identifiable {
    var id = UUID().uuidString
    var title : String
    var value : String
    var logo: String
}

var marketplaceData = [
    Sales(title: "SBB Half Fair Subscription", value: "7,500 GreenCoins", logo: "sbb"),
    Sales(title: "Trivium Packaging Voucher", value: "10,000 GreenCoins", logo: "trivium_logo"),
    Sales(title: "Swiss Made Direct 10% Discount", value: "3,000 GreenCoins", logo: "swissmadedirect"),
    Sales(title: "Live Green Notebooks", value: "5,000 GreenCoins", logo: "livegreen"),

]

var donationData = [
    Sales(title: "Caritas Switzerland", value: "Doing the right thing", logo: "caritas"),
    Sales(title: "Zero Waste Switzerland", value: "Demystifying alternatives to plastics", logo: "zerowaste"),

]

struct ProductView : View {
    var sales : Sales
    
    var body : some View {
        ZStack {
            Color.white.opacity(0.5)
            
            HStack {
                Image(sales.logo)
                    .resizable()
                    .frame(width: 75, height: 75)
                    .cornerRadius(50)
                
                Spacer(minLength: 5)
                
                VStack(alignment: .leading, spacing: 22) {
                    
                    Text(sales.title)
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(sales.value)
                        .foregroundColor(.white)
                }
                
                Spacer(minLength: 0)
            }
            .padding()
        }
        .cornerRadius(10)
        .frame(width: 350)
    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
