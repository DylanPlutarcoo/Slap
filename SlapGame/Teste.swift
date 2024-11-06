import SwiftUI
import VisionKit

struct VisionWindowView: View {
    @State private var isDetailViewPresented = false

    var body: some View {
        VStack {
            Text("Bem-vindo ao Slap")
                .font(.largeTitle)
                .padding()
            Text("Aqui você treina sua coordenação de forma ritmica e divertida,\n acerte as esferas para continuar a música.")
                .multilineTextAlignment(.center)
            Button(
                action: {
                    isDetailViewPresented = true
            },
                   label: {
                      Text("START")
                           .foregroundStyle(.white)
                           .background(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 100,height: 40)
                                .foregroundStyle(.pink)
                           )
                        
                   }
                
            )
            VStack{
                Text("teste")
            }
            .frame(width: 400, height: 400) // Tamanho da janela
            .background(Color.orange)
            .cornerRadius(40)
            .shadow(radius: 10)
            .offset(x:-700)
        }
        .frame(width: 1000, height: 1000)
        .background(Color.orange)// Tamanho da janela
        .cornerRadius(40)
        .shadow(radius: 10)
        .sheet(isPresented: $isDetailViewPresented) {
            DetailView()
        }
       
        
    }
    
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Nova Tela!")
                .font(.largeTitle)
                .padding()
            // Adicione mais conteúdo aqui
        }
    }
}

#Preview {
    VisionWindowView()
        .frame(minWidth: 1000,minHeight: 1000) // Tamanho mínimo da janela
        .preferredColorScheme(.light) // Use .dark para o modo escuro
}
