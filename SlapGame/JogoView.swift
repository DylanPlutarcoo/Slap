////
////  LogicaRitimca.swift
////  Creating 3D Shapes
////
////  Created by Gabriel Oliveira Plutarco on 12/11/24.
////  Copyright © 2024 Apple. All rights reserved.
////
//
//import SwiftUI
//
//struct LogicaRitmica: View {
//    @StateObject var music = Musica(timer: Timer())
//    //    @State var currentFirstLeft: Double
//    //    @State var currentFirstRight: Double
//    @State var colorLeft: UIColor = .gray
//    @State var colorRight: UIColor = .gray
//    var body: some View {
//        VStack{
//            HStack{
//                Button(
//                    action: {
//                        music.click = music.elapsedTime
//                        colorLeft = music.checkClick(click: music.click, time: music.correctTimeLeft,color: colorLeft)
//                        if colorLeft == .green {
//                            music.points += 10
//                        }
//                    }, label: {
//                        Circle()
//                            .frame(width: 70)
//                            .foregroundStyle(colorLeft)
//                    })
//                Button(
//                    action: {
//                        music.click = music.elapsedTime
//                        colorRight = music.checkClick(click: music.click, time: music.correctTimeRight,color: colorRight)
//                        if colorRight == .green {
//                            music.points += 10
//                        }
//                        
//                    }, label: {
//                        Circle()
//                            .frame(width: 70)
//                            .foregroundStyle(colorRight)
//                    })
//                
//            }
//        }.onAppear{
//            music.startTimer()
//            
//        }
//        .onChange(of: music.elapsedTime) {
//            print(music.elapsedTime)
//            if let first =  music.correctTimeLeft.first(where: {$0 >= music.elapsedTime}) {
//                if Double(first) - music.elapsedTime <= 1.0 {
//                    colorLeft =  .orange
//                }else {
//                    colorLeft = .gray
//                }
//            }
//            
//            if let first =  music.correctTimeRight.first(where: {$0 >= music.elapsedTime}) {
//                if music.elapsedTime - Double(first) <= 1.0 {
//                    colorRight =  .orange
//                }else {
//                    colorRight = .gray
//                }
//                
//                if music.elapsedTime == 0.9 {
//                    colorLeft = . orange
//                }
//            }
//        }
//    }
//}
//#Preview {
//    LogicaRitmica(colorLeft: .gray, colorRight: .gray)
//}
