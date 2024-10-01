//
//  RowCounterView.swift
//  Interview
//
//  Created by Yi Ling on 10/1/24.
//

import SwiftUI

struct RowCounterView: View {
    @ObservedObject var countermodel : CounterModel
    var body: some View {
        HStack{
            Circle()
                .fill(.red)
                .frame(width:5,height: 5)
                .blink()
            Text("\(countermodel.counter)")
                .foregroundStyle(countermodel.unToggled ?.black: .gray)
            
        }
        .onAppear{
            countermodel.appearHandler()
            if (countermodel.firstShown){
                countermodel.startCounter()
            }
        }
        .onDisappear{
            countermodel.disappearHandler()
        }
        .onTapGesture {
            if (countermodel.unToggled){
                countermodel.toggle()
            } else {
                countermodel.unToggle()
            }
        }
    }
}

struct BlinkAnimation: ViewModifier {
    @State private var opacity: CGFloat = 0

    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .animation(
                .easeInOut(duration: 1).repeatForever(),
                value: opacity
            )
            .onAppear(perform: { opacity = 1 })
    }
}

extension View {
    func blink() -> some View {
        modifier(BlinkAnimation())
    }
}

#Preview {
    ContentView()
}

