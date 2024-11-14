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
//    @State var isImmersiveSpaceOpen = false
    var body: some Scene {
//        WindowGroup(id: WindowName.start.realName) {
//            ContentView()
//        }
        WindowGroup(id: WindowName.start.realName) {
            Inicio()
        }
        .defaultSize(width: 990, height: 720)
        
        WindowGroup(id: WindowName.pause.realName) {
            PauseView()
        }.defaultSize(width: 577, height: 582)
        ImmersiveSpace(id: WindowName.immersiveSpace.realName) {
            ShapesView()
        }
//        .defaultSize(width: 3, height: 3, depth: 3, in: .meters)
    }
}

enum WindowName {
    case start, pause, immersiveSpace
    
    var realName: String {
        switch self {
        case .start:
            return "Inicio"
        case .immersiveSpace:
            return "ShapesView"
        case .pause:
            return "PauseWindow"
        }
    }
}
