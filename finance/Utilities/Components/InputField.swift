//
//  InputField.swift
//  finance
//
//  Created by Joao Pedro Messias Oliveira de Melo on 13/05/26.
//

import SwiftUI

struct InputField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    var iconName: String?
    var isSecure: Bool = false
    @Binding var showPassword: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .foregroundColor(.white)
                .font(.headline)
            
            HStack(spacing: 12) {
                Image(systemName: iconName ?? "")
                    .foregroundStyle(.gray)
                    .frame(width: 20)
                
                Group {
                    if isSecure {
                        if showPassword {
                            TextField(
                                "",
                                text: $text,
                                prompt: Text(placeholder).foregroundColor(.gray)
                            ).textContentType(.password).frame(height: 25)
                        } else {
                            SecureField(
                                "",
                                text: $text,
                                prompt: Text(placeholder).foregroundColor(.gray)
                            ).textContentType(.password).frame(height: 25)
                        }
                    } else {
                        TextField(
                            "",
                            text: $text,
                            prompt: Text(placeholder).foregroundColor(.gray)
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
