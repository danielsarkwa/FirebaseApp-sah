//
//  ReadFirestore.swift
//  FirebaseApp-sah
//
//  Created by Daniel Yeboah on 17.4.2023.
//

import SwiftUI

struct ReadFirestore: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    var body: some View {
        Text("My restaurant: \(firestoreManager.restaurant)")
            .padding()
    }
}

struct ReadFirestore_Previews: PreviewProvider {
    static var previews: some View {
        ReadFirestore()
            .environmentObject(FirestoreManager())
    }
}
