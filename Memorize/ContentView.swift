//
//  ContentView.swift
//  Memorize
//
//  Created by Mohamed Obaya on 15/04/2025.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "👹"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
            }
        }
        .foregroundStyle(.orange)
        
        .padding()
    }
}
struct CardView: View {
    let content: String
    @State var isFaceUp = false // add @State to change variables inside a View as View is immutable
    
    var body: some View { // Views are immutable
        ZStack {
            let cardBase = RoundedRectangle(cornerRadius: 12) // local variable
            if isFaceUp {
                cardBase
                    .fill(.white)
                cardBase
                    .strokeBorder(lineWidth: 2)
                Text(content)
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
