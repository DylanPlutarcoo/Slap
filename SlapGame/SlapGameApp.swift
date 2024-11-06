//
//  SlapGameApp.swift
//  SlapGame
//
//  Created by Gabriel Oliveira Plutarco on 05/11/24.
//

import SwiftUI

//@main
//struct SlapGameApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
@main
struct MyVisionApp: App {
    var body: some Scene {
        WindowGroup {
            VisionWindowView()
                .frame(minWidth: 500, minHeight: 400) // Tamanho mínimo da janela
        }
        .defaultSize(width: 3, height: 3, depth: 3, in: .meters)
    }
}
