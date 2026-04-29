//
//  RegisterView.swift
//  finance
//
//  Created by Joao Pedro Messias Oliveira de Melo on 28/04/26.
//

import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Register").font(.largeTitle).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)) {
                TextField("Email", text: $email).textInputAutocapitalization(.never).disableAutocorrection(true)
                
                SecureField("Password", text: $password)
            }
            
            Button("Register") {
                
            }.disabled(email.isEmpty || password.isEmpty)
        }
    }
}

#Preview {
    RegisterView()
}
