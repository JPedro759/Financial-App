//
//  RegisterView.swift
//  finance
//
//  Created by Joao Pedro Messias Oliveira de Melo on 28/04/26.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [Color.blue.opacity(0.7), Color.blue.opacity(0.3)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                // Title
                VStack(spacing: 8) {
                    Text("Create an Account")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Sign up to get started")
                        .foregroundColor(.white.opacity(0.8))
                }
                
                // Glass Card
                VStack(spacing: 16) {
                    CustomTextField(icon: "person", placeholder: "Full Name", text: $name)
                    CustomTextField(icon: "envelope", placeholder: "Email", text: $email)
                    
                    CustomSecureField(icon: "lock", placeholder: "Password", text: $password)
                    CustomSecureField(icon: "lock", placeholder: "Confirm Password", text: $confirmPassword)
                    
                    // Button
                    Button(action: {
                        // ação de cadastro
                    }) {
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(12)
                    }
                    .padding(.top, 10)
                    
                }
                .padding()
                .background(.ultraThinMaterial) // efeito glass
                .cornerRadius(20)
                .padding(.horizontal)
                
                // Footer
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(.white.opacity(0.8))
                    
                    Button("Login") {
                        // navegação
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                }
                .padding(.top, 10)
            }
        }
    }
}

struct CustomTextField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
            
            TextField(placeholder, text: $text)
                .autocapitalization(.none)
        }
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(10)
    }
}

struct CustomSecureField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            
            SecureField(placeholder, text: $text)
        }
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    SignUpView()
}
