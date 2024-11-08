//
//  GameModel.swift
//  SlapGame
//
//  Created by Vinicius Gabriel on 07/11/24.
//
/*
The app's model type for game state and gameplay information.
*/
import AVKit
import RealityKit
import SwiftUI

@Observable
class GameModel {
    var isPlaying = false
    var isPaused = false {
        didSet {
            if isPaused == true {
                // Pausa todas as animações
                for child in spaceOrigin.children {
                    if child.name.contains("ChordButton") {
                        child.stopAllAnimations(recursive: false)
                    }
                }
            } else {
                for child in spaceOrigin.children {
                    if child.name.contains("ChordButton") {
                        let start = Point3D(child.position)
                        let end = Point3D(
                            start.vector + .init(
                                x: ChordSpawnParameters.deltaX,
                                y: ChordSpawnParameters.deltaY,
                                z: ChordSpawnParameters.deltaZ
                            )
                        )
                    }
                }
            }
        }
    }
    var readyToStart = false
    
    var isFinished = false {
        didSet {
            if isFinished == true {
                clear()
            }
        }
    }
    var countDown = 3
    var score = 0
    
    var chordButtons: [ChordButton] = (0...50).map { ChordButton(id: $0, isPressed: false)}
    
    func clear() {
        spaceOrigin.children.removeAll()
    }
    
    func reset() {
        isPlaying = false
        isPaused = false
        isFinished = false
        countDown = 3
        score = 0
        
        chordButtons = (0...50).map {ChordButton(id: $0, isPressed: false) }
        chordNumber = 0
        
        clear()
    }
    
    init() {
//        If you give multiple objects in a scene the same name, the generated property returns an array containing all of the objects that share that name.
//        If you need to load a named object without using generated code, such as when working with downloaded reality files or loading objects created at runtime, you can use the findEntity(named:) function on the scene entity.
//        if let boxScene = try? Experience.loadBox() {
//            if let box = boxScene.findEntity(named: "Steel Box") {}
//                // Do something with box
//            }
//        }
        generateChordMovementAnimations()
    }
    
    func generateChordMovementAnimations() {
        for index in (0..<chordPaths.count) {
            let start = Point3D(
                x: chordPaths[index].0,
                y: chordPaths[index].1,
                z: chordPaths[index].2
            )
            let end = Point3D(
                x: start.x + ChordSpawnParameters.deltaX,
                y: start.y + ChordSpawnParameters.deltaY,
                z: start.z + ChordSpawnParameters.deltaZ
            )
            let speed = ChordSpawnParameters.speed
            
            let line = FromToByAnimation<Transform>(
                name: "line",
                from: .init(scale: .init(repeating: 1), translation: simd_float(start.vector)),
                to: .init(scale: .init(repeating: 1), translation: simd_float(end.vector)),
                duration: speed,
                bindTarget: .transform
            )
            
            let animation = try! AnimationResource
                .generate(with: line)
            
            chordMovementAnimations.append(animation)
        }
    }
    
}
