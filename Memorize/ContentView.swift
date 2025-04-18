//
//  ContentView.swift
//  Memorize
//
//  Created by Mohamed Obaya on 15/04/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundStyle(.orange)
        
        .padding()
    }
}
struct CardView: View {
    @State var isFaceUp = false // add @State to change variables inside a View as View is immutable
    
    var body: some View { // Views are immutable
        ZStack {
            let cardBase = RoundedRectangle(cornerRadius: 12) // local variable
            if isFaceUp {
                cardBase
                    .fill(.white)
                cardBase
                    .strokeBorder(lineWidth: 2)
                Text("👻")
                    .font(.largeTitle)
            } else {
                cardBase.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}
#Preview {
    ContentView()
}
