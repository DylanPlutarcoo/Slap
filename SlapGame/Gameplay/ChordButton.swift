//
//  ChordButton.swift
//  SlapGame
//
//  Created by Vinicius Gabriel on 07/11/24.
//

//import Accessibility
import Spatial
import RealityKit

class ChordButton: Identifiable {
    var id: Int
    var isPressed: Bool
    
    init(id: Int, isPressed: Bool) {
        self.id = id
        self.isPressed = isPressed
    }
}

// modelo principal do botão de acorde, é clonado quando um novo botão spawna.
var chordTemplate: Entity? = nil
var chordNumber = 0

// Armazena cada animação de movimento linear dos botões de acorde.
var chordMovementAnimations: [AnimationResource] = []

// Parâmetros de spawn de botões de acorde (em metros)
// delta -> (onde eles começam) + (onde terminam)
struct ChordSpawnParameters {
    static var deltaX = 0.02
    static var deltaY = -2.0
    static var deltaZ = 12.0
    
    static var speed = 12.0
}

//Contador que percorre os caminhos que o botão de acorde pode começar
var chordPathsIndex = 0

let chordPaths: [(Double, Double, Double)] = [
    (x: -0.8, y: 1.9, z: -8.0),
    (x: 0.8, y: 1.9, z: -8.0)
]
