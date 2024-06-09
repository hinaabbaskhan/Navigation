//
//  ContentView.swift
//  Navigation
//
//  Created by Hina Khan on 21/05/2024.
//

import SwiftUI



struct ContentView: View {
    
    @State private var path = [Int]()

    var body: some View {
            NavigationStack(path: $path) {
                VStack {
                    Button("Show 32") {
                        path = [32]
                    }
                    
                    Button("Show 64") {
                        path.append(64)
                    }
                    
                    Button("Show 32 then 64") {
                        path = [32, 64]
                    }
                }
                .navigationDestination(for: Int.self) { selection in
                    Text("You selected \(selection)")
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
