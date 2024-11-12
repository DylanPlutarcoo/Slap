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
                .font(.largeTitle)
                .bold()
            Image(systemName: "globe")
                .resizable()
                .frame(maxWidth: 400,maxHeight: 400)
            Text("Bata com sua mão esquerda e direita na ordem\n e no momento certo quando os blocos vierem\n na sua direção")
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .font(.title)
            Button(
                action: {
//                    dismissWindow()
                    openWindow(id: "PauseWindow")
                    Task {
                        if isImmersiveSpaceOpen == false {
                            await openImmersiveSpace(id:"ShapesView")
                            dismissWindow(id: "Inicio")
                        }
                    }
//                    Task {
////                        if isImmersiveSpaceOpen {
////                            await dismissImmersiveSpace()
//                        let result = await openImmersiveSpace(id: "ShapesView")
//                        switch result {
//                        case .opened:
//                            isImmersiveSpaceOpen = true
//                        case .userCancelled, .error:
//                            isImmersiveSpaceOpen = false
//                        @unknown default:
//                            isImmersiveSpaceOpen = false
//                        }
//                    }
//                        } else {
//                        isImmersiveSpaceOpen = true
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
//        .onAppear{
//            dismissWindow(id: "PauseWindow")
//            Task {
//                if isImmersiveSpaceOpen {
//                    await dismissImmersiveSpace()
//                }
//            }
//        }
    }
}
//struct VisionWindowView: App {
//    var body: some Scene {
//        WindowGroup(id: "inicio") {
//            Inicio()
//        }
//    }
//}
struct PauseView: View {
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @State var start: Bool = true
    var body: some View {
        VStack(spacing: 40){
            PauseButton(start: $start)
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
//        .onAppear {
//            dismissWindow(id: "Inicio")
//        }
    }
}

#Preview(windowStyle: .automatic){
    Inicio()
}
