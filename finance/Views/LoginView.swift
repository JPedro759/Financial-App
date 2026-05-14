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
        
            GeometryReader { geo in
                Circle()
                    .fill(Color.green.opacity(0.5))
                    .frame(width: 250, height: 250)
                    .blur(radius: 100)
                    .offset(x: -geo.size.width * 0.15, y: -0)
            }
            .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Spacer().frame(height: 120)
                
                // Header
                VStack(alignment: .leading, spacing: 10) {
                    Text("Welcome Back")
                        .font(.system(size: 38, weight: .bold,design: .rounded))
                        .foregroundStyle(.white)

                    Text("Login to view daily finance updates.")
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
                        showPassword: $showPassword
                    )
                    InputField(
                        label: "Password",
                        placeholder: "Enter your password",
                        text: $password,
                        iconName: "lock.fill",
                        isSecure: true,
                        showPassword: $showPassword
                    )
                    
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

                    Text("OR")
                        .foregroundStyle(.gray)
                        .fontWeight(.bold)

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
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
