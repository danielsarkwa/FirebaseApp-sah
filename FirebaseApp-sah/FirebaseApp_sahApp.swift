//
//  FirebaseApp_sahApp.swift
//  FirebaseApp-sah
//
//  Created by Daniel Yeboah on 16.4.2023.
//

import SwiftUI
import Firebase

@main
struct FirebaseApp_sahApp: App {
    @StateObject var firestoreManager = FirestoreManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(firestoreManager)
        }
    }
}
