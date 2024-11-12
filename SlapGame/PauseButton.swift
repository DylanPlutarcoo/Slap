//
//  PauseButton.swift
//  SlapGame
//
//  Created by Gabriel Oliveira Plutarco on 07/11/24.
//

import SwiftUI

struct PauseButton: View {
    @Binding var start: Bool
    var body: some View {
        Button(
            action: {
                start.toggle()
            },
            label: {
                Circle()
                    .overlay{
                        Image(systemName: start ? "pause.fill" : "play.fill" )
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 40,height: 40)
                            
                    }
                    .frame(width: 200)
                    .foregroundStyle(start ? .gray : .orange)
            }
        )
    }
}

#Preview {
    PauseButton(start: .constant(true))
}
