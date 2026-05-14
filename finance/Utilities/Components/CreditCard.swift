//
//  CreditCard.swift
//  finance
//
//  Created by Joao Pedro Messias Oliveira de Melo on 18/03/26.
//

import SwiftUI

struct CreditCard: View {
    var cardNumber: String
    var cardHolderName: String
    var expiryDate: String
    var gradientColors: Gradient

    var body: some View {
        ZStack {
            // 1. Fundo com Gradiente
            RoundedRectangle(cornerRadius: 24)
                .fill(LinearGradient(
                    gradient: gradientColors,
                    startPoint: .topTrailing,
                    endPoint: .bottomLeading
                ))
                .frame(height: 240) // Altura fixa para todos os cartões
                .blur(radius: 10)

            // 3. Conteúdo Principal
            VStack(alignment: .leading, spacing: 10) {
                // Ícone de Pagamento por Aproximação
                HStack() {
                    Image(systemName: "wave.3.right")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white.opacity(0.8))
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, -10)
                
                ChipView().padding(.bottom, 10)
                
                // Número do Cartão
                Text(cardNumber)
                    .font(
                        .system(
                            size: 16,
                            weight: .semibold,
                            design: .monospaced
                        )
                    )
                    .foregroundColor(.white)
                    .tracking(-1) // Espaçamento entre letras

                // Linha Inferior: Nome, Data e Logo
                HStack(alignment: .center) {
                    HStack(alignment: .center) {
                        Text(cardHolderName)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.white.opacity(0.9))
                        
                        Text(expiryDate)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.white.opacity(0.9))
                    }
                }
                
                HStack {
                    // Logo Mastercard (Simulado com dois círculos sobrepostos)
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.6))
                            .frame(width: 35, height: 35)
                            .offset(x: -20)
                            .blur(radius: 0.6)
                        
                        Circle()
                            .fill(Color.white.opacity(0.4))
                            .frame(width: 35, height: 35)
                            .blur(radius: 0.6)
                    }
                }.frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(30) // Padding interno de todo o conteúdo
            .frame(height: 240)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24)) // Aplica o arredondamento e sombra a todo o ZStack
        .shadow(
            color: Color.black.opacity(0.1),
            radius: 10, x: 0, y: 5
        )
        .padding(8)
    }
}

struct ChipView: View {
    var body: some View {
        ZStack {
            // Base do chip
            RoundedRectangle(cornerRadius: 8)
                .fill(
                    LinearGradient(
                        colors: [Color.white.opacity(0.5), Color.white.opacity(0.2)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 45, height: 35)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                )
            
            // Linhas horizontais e verticais (os "contatos")
            VStack(spacing: 8) {
                HStack(spacing: 16) {
                    Rectangle()
                        .fill(Color.white.opacity(0.3))
                    Rectangle()
                        .fill(Color.white.opacity(0.3))
                }
                .frame(height: 1)
                
                HStack(spacing: 16) {
                    Rectangle()
                        .fill(Color.white.opacity(0.3))
                    Rectangle()
                        .fill(Color.white.opacity(0.3))
                }
                .frame(height: 1)
                
                HStack(spacing: 16) {
                    Rectangle()
                        .fill(Color.white.opacity(0.3))
                    Rectangle()
                        .fill(Color.white.opacity(0.3))
                }
                .frame(height: 1)
            }
            
            HStack(spacing: 14) {
                Rectangle()
                    .fill(Color.white.opacity(0.3))
                    .frame(width: 1)
                
                Rectangle()
                    .fill(Color.white.opacity(0.3))
                    .frame(width: 1)
            }
        }
        .frame(width: 45, height: 35) // Garante que o chip não estique
    }
}

#Preview {
    VStack {
        CreditCard(
            cardNumber: "1291 0298 3012 9434",
            cardHolderName: "D Maryuandi",
            expiryDate: "12/24",
            gradientColors: Gradient(colors: [Color.orange, Color.pink, Color.purple])
        )
        CreditCard(
            cardNumber: "1230 4320 2349 0298",
            cardHolderName: "Alejandro J",
            expiryDate: "12/24",
            gradientColors: Gradient(colors: [Color.black, Color.deepNavy, Color.blue])
        )
    }.padding(8)
}
