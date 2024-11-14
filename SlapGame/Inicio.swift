import SwiftUI
import VisionKit

struct Inicio: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @State private var isImmersiveSpaceOpen = false
    var body: some View {
        VStack(spacing: 25){
            Text("Slap")
                .font(.extraLargeTitle)
                .bold()
                .foregroundStyle(.orange)
            Image(systemName: "hand.raised.fill")
                .resizable()
                .frame(width:445, height: 360,alignment: .center)
                .foregroundStyle(.orange)
//                .frame(maxWidth: 400,maxHeight: 400)
//            Text("Bata com sua mão esquerda e direita na ordem\n e no momento certo quando os blocos vierem\n na sua direção")
            Text("Aperte as esferas à sua direita e à sua esquerda, quando estiverem laranjas, para somar pontos")
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
            Button(
                action: {
                    openWindow(id: "PauseWindow")
                    Task {
                        if isImmersiveSpaceOpen == false {
                            await openImmersiveSpace(id:"ShapesView")
                            dismissWindow(id: "Inicio")
                        }
                    }
                },
                label: {
                    Text("Jogar")
                        .foregroundStyle(.white)
                        .frame(width: 270,height: 50)
                }
            )
            .padding()
            .controlSize(.extraLarge)
            .buttonBorderShape(.capsule)
        }
    }
}

struct PauseView: View {
    @EnvironmentObject var soundViewModel: SoundViewModel
    @EnvironmentObject var music: Musica
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @State var start: Bool = true
    var body: some View {
        VStack(spacing: 40){
            PauseButton(start: $start, actionSom: soundViewModel.toggleMute, actionTimer: music.toggleTimer)
            Button(
                action: {
                    Task {
                        dismissWindow()
                        await dismissImmersiveSpace()
                        openWindow(id: "Inicio")
                    }
                },
                label: {
                    RoundedRectangle(cornerRadius: 100)
                        .overlay{
                            Text("Sair")
                                .foregroundStyle(.white)
                        }
                        .frame(width: 320,height: 51)
                        .foregroundStyle(.gray)
                }
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview(windowStyle: .automatic){
    Inicio()
}
