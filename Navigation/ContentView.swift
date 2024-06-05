//
//  ContentView.swift
//  Navigation
//
//  Created by Hina Khan on 21/05/2024.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                DetailView(number: 556)
            }
        }
    }
}

struct DetailView: View {
    var number: Int

    var body: some View {
        Text("Detail View \(number)")
    }

    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

#Preview {
    ContentView()
}
