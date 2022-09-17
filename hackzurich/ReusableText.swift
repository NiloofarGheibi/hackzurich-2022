//
//  ReusableText.swift
//  AKQuiz
//
//  Created by Rocha, Isabelly on 16.09.22.
//
import Foundation
import SwiftUI

struct ReusableText: View {
    var text: String
    var size: CGFloat
    var body: some View {
        Text(text)
            .font(.system(size: size, weight: .bold, design: .rounded))
            .foregroundColor(.black)
            .shadow(color: Color.white, radius: 2, x: 0, y: 3)
    }
}
