//
//  LoginView.swift
//  finance
//
//  Created by Joao Pedro Messias Oliveira de Melo on 29/04/26.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var rememberMe = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.black, .deepNavy],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea() // Fundo preto total
        
            Circle()
                .fill(Color.green.opacity(0.5))
                .frame(width: 250, height: 250)
                .blur(radius: 100)
                .offset(x: -120, y: -300)
            
            VStack(alignment: .leading) {
                Spacer().frame(height: 120)
                
                // Header
                VStack(alignment: .leading, spacing: 10) {
                    Text("Welcome Back")
                        .font(.system(size: 38, weight: .bold,design: .rounded))
                        .foregroundStyle(.white)

                    Text("Login to view daily finance updates.")
                        .foregroundStyle(.gray)
                }.padding(.horizontal, 20)
                
                Spacer().frame(height: 50)

                // Formulário
                VStack(spacing: 20) {
                    inputField(label: "Email", text: $email)
                    inputField(label: "Password", text: $password, isSecure: true)
                    
                    HStack(spacing: 20) {
                        Button {
                            rememberMe.toggle()
                        } label: {
                            HStack(spacing: 10) {
                                Image(systemName: rememberMe ? "checkmark.square.fill" : "square")
                                    .foregroundStyle(rememberMe ? Color.green : Color.gray)
                                    .font(.title3)
                                
                                Text("Remember me").foregroundStyle(.white).font(.subheadline)
                                
                                Spacer()
                            }
                        }
                        
                        Button(action: {}) {
                            Text("Forgot password?")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .underline(true)
                        }
                    }
                    
                    Button(action: {}) {
                        Text("Sign In").fontWeight(.medium)
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
                
                HStack(spacing: 20) {
                    Rectangle()
                        .fill(.gray.opacity(0.5))
                        .frame(height: 2)
                        .clipShape(Capsule())

                    Text("OR").foregroundStyle(.gray)

                    Rectangle()
                        .fill(.gray.opacity(0.5))
                        .frame(height: 2)
                        .clipShape(Capsule())
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                
                // Google
                Button {

                } label: {
                    HStack(spacing: 10) {
                        Image("google")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)

                        Text("Sign in with Google")
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.white.opacity(0.08), lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                }.padding(.all, 20)
                
                // Apple
                SignInWithAppleButton(
                    .signIn,
                    onRequest: { request in
                        
                    },
                    onCompletion: { result in
                        
                    }
                )
                .signInWithAppleButtonStyle(.white)
                .frame(height: 55)
                .cornerRadius(16)
                .padding(.horizontal, 20)
                
                HStack(alignment: .center) {
                    Text("Don't have an account?")
                        .foregroundColor(.white)
                        .font(.subheadline)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .foregroundColor(.blue)
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.all, 20)
            }
        }
        .ignoresSafeArea(.container, edges: .top)
    }

    // Helper para os campos de entrada
    @ViewBuilder
    func inputField(
        label: String,
        text: Binding<String>,
        isSecure: Bool = false
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .foregroundColor(.white)
                .font(.headline)
            
            HStack(spacing: 12) {
                Image(systemName: isSecure ? "lock" : "envelope")
                    .foregroundStyle(.gray)
                    .frame(width: 20)
                
                Group {
                    if isSecure {
                        if showPassword {
                            TextField(
                                "",
                                text: text,
                                prompt: Text("Enter your password").foregroundColor(.gray)
                            ).textContentType(.password).frame(height: 25)
                        } else {
                            SecureField(
                                "",
                                text: text,
                                prompt: Text("Enter your password").foregroundColor(.gray)
                            ).textContentType(.password).frame(height: 25)
                        }
                    } else {
                        TextField(
                            "",
                            text: text,
                            prompt: Text("Enter your email").foregroundColor(.gray)
                        ).foregroundStyle(Color.white).frame(height: 25)
                    }
                }
                .foregroundStyle(.white)
                
                // Eye button
                if isSecure {
                    Toggle(
                        "Eye",
                        systemImage: showPassword ? "eye.slash" : "eye",
                        isOn: $showPassword
                    )
                    .font(.callout)
                    .tint(.gray)
                    .toggleStyle(.button)
                    .labelStyle(.iconOnly).frame(height: 25)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.green.opacity(0.3), lineWidth: 2)
                    )
            )
        }
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
