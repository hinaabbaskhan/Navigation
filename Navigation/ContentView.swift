//
//  ContentView.swift
//  Navigation
//
//  Created by Hina Khan on 21/05/2024.
//

import SwiftUI
import Foundation

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            
            
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }

        // Still here? Start with an empty path.
        path = NavigationPath()
    }

    func save() {
        
        guard let representation = path.codable else { return }

        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}





struct ContentView: View {
    @State private var pathStore = PathStore()

    var body: some View {
        
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
        }
    }
}


//            NavigationStack(path: $path) {
//                VStack {
//                    Button("Show 32") {
//                        path = [32]
//                    }
//                    
//                    Button("Show 64") {
//                        path.append(64)
//                    }
//                    
//                    Button("Show 32 then 64") {
//                        path = [32, 64]
//                    }
//                }
//                .navigationDestination(for: Int.self) { selection in
//                    Text("You selected \(selection)")
//                }
//            }
//        }
//}


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
