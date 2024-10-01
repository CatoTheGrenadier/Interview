//
//  ContentView.swift
//  Interview
//
//  Created by Yi Ling on 10/1/24.
//

import SwiftUI

struct ContentView: View {
    let counters = (0..<50).map { _ in CounterModel() }
    var body: some View {
        List{
            ForEach(counters){ i in
                RowCounterView(countermodel: i)
            }
        }
    }
}

#Preview {
    ContentView()
}
