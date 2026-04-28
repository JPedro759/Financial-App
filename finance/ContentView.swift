//
//  ContentView.swift
//  finance
//
//  Created by Joao Pedro Messias Oliveira de Melo on 18/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
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
                }.padding(.horizontal, 15)
                
                VStack(spacing: 10) {
                    Text("Innovative Digital App Financial Planner")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text("Finance Help you to manage your financial problem easily and efficiently")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                }.padding(.horizontal, 15)
                
                VStack(spacing: 10) {
                    NavigationLink {
                        HomeView()
                    } label: {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(
                                    colors: [Color.darkBlue, Color.blue.opacity(0.8)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("Doesn't have an account?")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        NavigationLink {
                            HomeView()
                        } label: {
                            Text("Sign Up").font(.subheadline).fontWeight(.semibold)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
