//
//  RegisterView.swift
//  finance
//
//  Created by Joao Pedro Messias Oliveira de Melo on 28/04/26.
//

import SwiftUI
import AuthenticationServices

struct SignUpView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showPassword = false
    @State private var rememberMe = false
    
    @State private var authorizationResult: ASAuthorization? = nil
    @State private var error: Error? = nil

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
                    .offset(x: -geo.size.width * 0.15, y: 0)
            }
            .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                // Header
                VStack(alignment: .leading, spacing: 10) {
                    Text("Create an Account")
                        .font(.system(size: 38, weight: .bold,design: .rounded))
                        .foregroundStyle(.white)
                    
                    Text("Create your account for daily updates.")
                        .foregroundStyle(.white.opacity(0.8))
                }.padding(.horizontal, 20)
                
                Spacer().frame(height: 25)
                
                // Formulário
                VStack(spacing: 20) {
                    InputField(
                        label: "Username",
                        placeholder: "Enter your username",
                        text: $name,
                        iconName: "person.fill",
                        showPassword: .constant(false)
                    )
                    InputField(
                        label: "Email",
                        placeholder: "Enter your email",
                        text: $email,
                        iconName: "envelope.fill",
                        showPassword: .constant(false)
                    )
                    InputField(
                        label: "Password",
                        placeholder: "Enter your password",
                        text: $password,
                        iconName: "lock.fill",
                        isSecure: true,
                        showPassword: $showPassword
                    )
                    InputField(
                        label: "Confirm password",
                        placeholder: "Confirm your password",
                        text: $confirmPassword,
                        iconName: "lock.fill",
                        isSecure: true,
                        showPassword: $showPassword
                    )
                    
                    Button(action: {}) {
                        Text("Create Account")
                            .font(.system(size: 20))
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
                    }.padding(.top, 10)
                }.padding(.horizontal, 20)
                
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
                .padding(.all, 20)
                
                HStack {
                    // Google
                    Button {

                    } label: {
                        HStack(spacing: 6) {
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)

                            Text("Sign up with Google")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        }
                        .frame(width: 175, height: 50)
                        .background(Color.white.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white.opacity(0.2), lineWidth: 2)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    
                    // Apple
                    SignInWithAppleButton(
                        .signUp,
                        onRequest: { request in
                            request.requestedScopes = [.fullName, .email]
                        },
                        onCompletion: { result in
                            switch result {
                            case .success(let credential):
                                print("Success: \(authorizationResult?.description ?? "")")
                            case .failure(let error):
                                print("Error: \(error)")
                            }
                        }
                    )
                    .signInWithAppleButtonStyle(.white)
                    .frame(width: 175, height: 50)
                    .cornerRadius(16)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.white)
                        .font(.subheadline)
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Sign In")
                            .foregroundColor(.blue)
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 20)
            }
        }
    }
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}
