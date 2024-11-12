import RealityKit
import SwiftUI
import RealityKitContent
struct Esfera: View {
    @State var colorSphere1: UIColor
    @State var colorSphere2: UIColor
    var body: some View {
        HStack {
            RealityView { content in
                do {
                    let esfera1 = try await Entity(named: "Scene", in: realityKitContentBundle)
                    
                    let sphere = esfera1.findEntity(named: "Sphere")!
                    
                    var model = sphere.components[ModelComponent.self]!
                    
                    if var material = model.materials.first as? PhysicallyBasedMaterial {
                        material.baseColor.tint = colorSphere1
                        model.materials = [material]
                        sphere.components.set(model)
                    }
                    
                    content.add(esfera1)
                } catch {
                    print("error loading cube1 ", error)
                }
            }
            RealityView { content in
                do {
                    let esfera2 = try await Entity(named: "Scene", in: realityKitContentBundle)
                    
                    let sphere = esfera2.findEntity(named: "Sphere")!
                    
                    var sphere2 = sphere.components[ModelComponent.self]!
                    
                    if var material = sphere2.materials.first as? PhysicallyBasedMaterial {
                        material.baseColor.tint = colorSphere2
                        sphere2.materials = [material]
                        sphere.components.set(sphere2)
                    }
                    content.add(esfera2)
                    } catch {
                        print("error loading cube2", error)
                    }
                }
            }
        }
    }
    
#Preview {
    Esfera(colorSphere1: .green, colorSphere2: .red)
}
