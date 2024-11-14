//
//  ViewModel.swift
//  Logica
//
//  Created by Gabriel Oliveira Plutarco on 12/11/24.
//

import Foundation
import SwiftUI
import Combine
class Musica: ObservableObject {
    @Published var timer: Timer
    @Published var elapsedTime: TimeInterval = 0.0
    @Published var correctTimeLeft: [Double]
    @Published var correctTimeRight: [Double]
    @Published var points: Int
    @Published var click: Double
    private var startTime: Date?  // Armazena o tempo de início do timer
    private var timeWhenPaused: TimeInterval = 0  // Armazena o tempo já passado quando o timer é pausado
    private var isRunning: Bool = false
        
    
    init(timer: Timer, correctTimeLeft: [Float] = [], correctTimeRight: [Float] = []) {
        self.timer = timer
        self.correctTimeLeft = [10, 14, 18, 22, 26, 30, 34, 38, 42, 46, 50, 54, 58,60, 68, 76, 84,90, 94, 98, 102, 106, 110, 114, 118,122, 126, 130, 134, 138]
        self.correctTimeRight =  [ 12, 16, 20, 24, 28,32, 36, 40, 44, 48, 52, 56, 64, 72, 80, 88,92, 96, 100, 104, 108, 112, 116,120, 124, 128, 132, 136]
        self.click = 10
        self.points = 0
    }
    func checkClick (click: Double,time: [Double],color : UIColor) -> UIColor {
//        if ((elapsedTime - TimeInterval(0.1))/2)-Int(elapsedTime) == 45 {
        
        if time.contains(click) || time.contains(click+1) || color == .orange {
                return .green
            }else {
                return .red
        }
    }
    func startTimer() {
          elapsedTime = 0.0  // Reinicia o tempo quando o timer começa
          timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
              self?.elapsedTime += 1.0 // Incrementa o tempo em segundos
             
          }
      }
    func toggleTimer() {
           if isRunning {
               // Pausar o timer
               timer.invalidate()  // Para o timer
               timeWhenPaused = elapsedTime  // Armazena o tempo quando o timer é pausado
               timer = Timer()  // Limpa a referência do timer
           } else {
               // Iniciar ou retomar o timer
               startTime = Date()  // Registra o tempo de início
               timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                   guard let self = self else { return }
                   self.elapsedTime = self.timeWhenPaused + Date().timeIntervalSince(self.startTime ?? Date())
               }
           }
           isRunning.toggle()  // Alterna o estado do timer (iniciado/pause)
       }
}
