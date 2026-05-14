//
//  ForgotPasswordView.swift
//  finance
//
//  Created by Joao Pedro Messias Oliveira de Melo on 14/05/26.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var email: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.black, .deepNavy],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea() // Fundo preto total
        
            GeometryReader { geo in
                Circle()
                    .fill(Color.green.opacity(0.5))
                    .frame(width: 250, height: 250)
                    .blur(radius: 100)
                    .offset(x: -geo.size.width * 0.15, y: -0)
            }
            .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                // Header
                VStack(alignment: .leading, spacing: 10) {
                    Text("Forgot Password")
                        .font(.system(size: 38, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)

                    Text("Reset your password to access Finance.")
                        .foregroundStyle(.white.opacity(0.8))
                }.padding(.horizontal, 20)
                
                Spacer().frame(height: 35)

                // Formulário
                VStack(spacing: 20) {
                    InputField(
                        label: "Email",
                        placeholder: "Enter your email",
                        text: $email,
                        iconName: "envelope.fill",
                        showPassword: .constant(false)
                    )
                    
                    Button(action: {}) {
                        Text("Send Code")
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    colors: [.green, Color(hex: "#BBFF2B")],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            ).clipShape(Capsule())
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal, 20)
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ForgotPasswordView()
}
