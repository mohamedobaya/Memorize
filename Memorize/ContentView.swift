//
//  ContentView.swift
//  Memorize
//
//  Created by Mohamed Obaya on 15/04/2025.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "👹", "💀", "🕸️", "🧙🏻‍♀️", "🐈‍⬛", "👺", "😱", "☠️", "🍭"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
        
    }
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){ // LazyGrid uses as less space as it can
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardCountAdjusters: some View{
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardRemover: some View{
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true // add @State to change variables inside a View as View is immutable
    
    var body: some View { // Views are immutable
        ZStack {
            let cardBase = RoundedRectangle(cornerRadius: 12) // local variable
            Group {
                cardBase.fill(.white)
                cardBase.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            cardBase.fill().opacity(isFaceUp ? 0: 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
