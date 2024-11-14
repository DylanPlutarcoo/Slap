//
//  File.swift
//  SlapGame
//
//  Created by Gabriel Oliveira Plutarco on 14/11/24.
//

import Foundation
import AVFoundation
class SoundViewModel: ObservableObject {
    @Published  var audioPlayer: AVAudioPlayer?
        func playSound(sound: String) {
            // Caminho para o arquivo de som no bundle
            if let path = Bundle.main.path(forResource: sound, ofType: "mp3") {
                let url = URL(fileURLWithPath: path)
                
                do {
                    // Inicializar o AVAudioPlayer com o som
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.play() // Tocar o som
                } catch {
                    print("Erro ao tocar o som: \(error.localizedDescription)")
                }
            } else {
                print("Erro: Arquivo de som não encontrado.")
            }
    }
    func toggleMute() {
           if let player = audioPlayer {
               if player.isPlaying {
                   player.pause()  // Se estiver tocando, pausar
               } else {
                   player.play()  // Se estiver pausado, continuar tocando
               }
           }
       }
}
