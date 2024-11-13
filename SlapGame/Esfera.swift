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
    
    let yellowMaterial = SimpleMaterial(color: .yellow, isMetallic: true)
    let redMaterial = SimpleMaterial(color: .red, isMetallic: true)
    //    @State var position: SIMD3<Float>? = nil
    var body: some View {
        HStack(spacing: 25) {
            RealityView { content in
                let sphere1 = ModelEntity()
                let appearenceSphere1 = ModelComponent(
                    mesh: .generateSphere(radius: 0.3),
                    materials: [redMaterial]
                )
                sphere1.components.set(appearenceSphere1)
                sphere1.components.set(InputTargetComponent())
                sphere1.components.set(CollisionComponent(shapes: [.generateSphere(radius: 0.3)]))
                content.add(sphere1)
            } update: { content in
                if let model = content.entities.first {
                    if changeSphere1 == true {
                        model.components.set(ModelComponent(mesh: .generateSphere(radius: 0.3), materials: [yellowMaterial]))
                    } else {
                        model.components.set(ModelComponent(mesh: .generateSphere(radius: 0.3), materials: [redMaterial]))
                    }
                }
            }
            .gesture(TapGesture().targetedToAnyEntity().onEnded { _ in
                changeSphere1.toggle()
            })
            RealityView { content in
                let sphere2 = ModelEntity()
                let appearenceSphere2 = ModelComponent(
                    mesh: .generateSphere(radius: 0.3),
                    materials: [yellowMaterial]
                )
                // Habilita interações com a Entidade
                sphere2.components.set(appearenceSphere2)
                sphere2.components.set(InputTargetComponent())
                sphere2.components.set(CollisionComponent(shapes: [.generateSphere(radius: 0.3)]))
                content.add(sphere2)
            } update: { content in
                if let model = content.entities.first {
                    if changeSphere2 == true {
                        model.components.set(ModelComponent(mesh: .generateSphere(radius: 0.3), materials: [yellowMaterial]))
                    } else {
                        model.components.set(ModelComponent(mesh: .generateSphere(radius: 0.3), materials: [redMaterial]))
                    }
                }
            }
            .gesture(TapGesture().targetedToAnyEntity().onEnded { _ in
                changeSphere2.toggle()
            })
        }
    }
    
    // Positions and adds all geometric shapes to the scene.
    //    func addGeometryShapes(to content: RealityViewContent) {
    //        / An array of all the 3D entities representing different shapes.
    //        let allGeometryEntities = [
    //            ShapesView.createSphereEntity(),
    //            ShapesView.createSphereEntity()
    //        ]
    //
    //        //let xOffsets: [Float] = [/*-0.1, 0.1, 0*/0.5, 2, 0.5] // Ajuste esses valores para centralizar as esferas
    //
    //                // Define as posições e adiciona as esferas ao conteúdo
    //        for (/*index, */entity) in allGeometryEntities.enumerated() {
    //                   entity.position.x = xOffsets[index]
    //            content.add(entity)
    //        }
    //    }
}
