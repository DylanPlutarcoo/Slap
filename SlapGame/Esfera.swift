//
//  Esfera.swift
//  SlapGame
//
//  Created by Gabriel Oliveira Plutarco on 11/11/24.
//

import SwiftUI
import RealityKit


struct ShapesView: View {
    //    @State private var sphere1: ModelEntity
    //    @State private var sphere2: ModelEntity
    @State private var sphereMaterial = SimpleMaterial()
    @State private var changeSphere1 = false
    @State private var changeSphere2 = false
    
    let yellowMaterial = SimpleMaterial(color: .yellow, isMetallic: false)
    let redMaterial = SimpleMaterial(color: .red, isMetallic: false)
    
    var body: some View {
        RealityView { content in
            let ballMesh = MeshResource.generateSphere(radius: 0.2)
            
            let sphere1 = ModelEntity(mesh: ballMesh,materials: [redMaterial])
            sphere1.components.set(InputTargetComponent())
            sphere1.components.set(CollisionComponent(shapes: [.generateSphere(radius: 0.2)]))
            sphere1.position = SIMD3(x: -0.5, y: 0.8, z: -1.5)
            content.add(sphere1)
            
            let sphere2 = ModelEntity(mesh: ballMesh, materials: [yellowMaterial])
            sphere2.components.set(InputTargetComponent())
            sphere2.components.set(CollisionComponent(shapes: [.generateSphere(radius: 0.2)]))
            sphere2.position = SIMD3(x: 0.5, y: 0.8, z: -1.5)
            content.add(sphere2)
        } update: { content in
            if let sphere1 = content.entities.first {
                sphere1.components.set(ModelComponent(
                    mesh: .generateSphere(radius: 0.2),
                    materials: [changeSphere1 ? yellowMaterial : redMaterial])
                )
            }
            if content.entities.count > 1{
                let sphere2 = content.entities[1]
                sphere2.components.set(ModelComponent(
                    mesh: .generateSphere(radius: 0.2),
                    materials: [changeSphere2 ? yellowMaterial : redMaterial]
                ))
            }
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded { entity in
            if entity.entity.position.x < 0 {
                changeSphere1.toggle()
            } else if entity.entity.position.x > 0 {
                changeSphere2.toggle()
            }
        })
//            if let model = content.entities.first {
//                if changeSphere1 == true {
//                    model.components.set(ModelComponent(mesh: .generateSphere(radius: 0.3), materials: [yellowMaterial]))
//                } else {
//                    model.components.set(ModelComponent(mesh: .generateSphere(radius: 0.3), materials: [redMaterial]))
//                }
//            }
    }
}
