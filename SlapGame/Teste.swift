import SwiftUI
import VisionKit

struct Inicio: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    var body: some View {
        VStack(spacing: 25){
            Text("Slap")
                .font(.largeTitle)
                .bold()
                .padding(.top,220)
            Image(systemName: "globe")
                .resizable()
                .frame(width: 400,height: 400)
            Text("Bata com sua mão esquerda e direita na ordem\n e no momento certo quando os blocos vierem\n na sua direção")
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .font(.title)
                .frame(width: 1000,height: 100)
            
            Button(
                action: {
                    openWindow(id: "PauseWindow")
                },
                label: {
                    Text("Jogar")
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 50)
                                .frame(width: 270,height: 50)
                                .foregroundStyle(.pink)
                        )
                    
                }
                
            ).padding()
        }.onAppear{
            dismissWindow(id: "PauseWindow")
        }
    }
}
struct VisionWindowView: App {
    var body: some Scene {
        WindowGroup(id: "inicio") {
            Inicio()
          
        }
        
    }
}

struct PauseView: View {
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.openWindow) private var openWindow
    @State var start: Bool = true
    var body: some View {
        VStack(spacing: 40){
            PauseButton(start: $start)
            Button(
                action: {
                    
                    openWindow(id: "Inicio")
                    
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
        .onAppear {
            dismissWindow(id: "Inicio")
        }
    }
}

#Preview(windowStyle: .automatic){
    Inicio()
}
