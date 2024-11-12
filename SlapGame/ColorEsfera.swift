//
//  SwiftUIView.swift
//  SlapGame
//
//  Created by Gabriel Oliveira Plutarco on 11/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct SwiftUIView: View {
    var body: some View {
        RealityView { content in
            if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                print(scene.children)
                
                let sphere = scene.findEntity(named: "Sphere")!
                
                var model = sphere.components[ModelComponent.self]!
                
                if var material = model.materials.first as? PhysicallyBasedMaterial {
                    material.baseColor.tint = .green
                    model.materials = [material]
                    sphere.components.set(model)
                }
                
                content.add(scene)
                
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
