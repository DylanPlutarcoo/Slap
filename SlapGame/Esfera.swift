//
//  Esfera.swift
//  SlapGame
//
//  Created by Gabriel Oliveira Plutarco on 11/11/24.
//

import SwiftUI
import RealityKit


struct ShapesView: View {
    var body: some View {
        RealityView { content in
            addGeometryShapes(to: content)
        }
    }


    // Positions and adds all geometric shapes to the scene.
    func addGeometryShapes(to content: RealityViewContent) {
        /// An array of all the 3D entities representing different shapes.
        let allGeometryEntities = [
            ShapesView.createSphereEntity(),
            ShapesView.createSphereEntity()
        ]

        let xOffsets: [Float] = [-0.1, 0.1] // Ajuste esses valores para centralizar as esferas

                // Define as posições e adiciona as esferas ao conteúdo
                for (index, entity) in allGeometryEntities.enumerated() {
                    entity.position.x = xOffsets[index]
                    content.add(entity)
                }
    }
}
#Preview(windowStyle: .automatic) {
    ShapesView()
}
