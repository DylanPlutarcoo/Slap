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
    
}
