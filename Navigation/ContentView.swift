//
//  ContentView.swift
//  Navigation
//
//  Created by Hina Khan on 21/05/2024.
//

import SwiftUI



struct ContentView: View {
    @State private var path = NavigationPath()
    @State private var path = [Int]()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }

                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
        }
        .toolbar {
            Button("Push 556") {
                path.append(556)
            }

            Button("Push Hello") {
                path.append("Hello")
            }
        }

        }
}


struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}


struct DetailView: View {
    var number: Int

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

#Preview {
    ContentView()
}
