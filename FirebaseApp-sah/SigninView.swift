//
//  SigninView.swift
//  FirebaseApp-sah
//
//  Created by Daniel Yeboah on 17.4.2023.
//

import SwiftUI
import Firebase

struct SigninView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            Button(action: { login() }) {
                Text("Sign In")
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription ?? "") // because it's from an API, it mostly likely going to ne optional - meaning no data
            } else {
                print("success")
            }
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
