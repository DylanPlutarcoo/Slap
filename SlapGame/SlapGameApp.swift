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
        
        WindowGroup(id: WindowName.start.realName) {
            Inicio()
        }
        .defaultSize(width: 3, height: 3, depth: 3, in: .meters)
        
        WindowGroup(id: WindowName.pause.realName) {
            PauseView()
                
        }.defaultSize(width: 577, height: 582)
    }
}

enum WindowName {
    case start, pause
    
    var realName: String {
        switch self {
        case .start:
            return "Inicio"
        case .pause:
            return "PauseWindow"
        }
    }
}
