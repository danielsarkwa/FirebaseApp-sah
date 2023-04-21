//
//  FirestoreManager.swift
//  FirebaseApp-sah
//
//  Created by Daniel Yeboah on 17.4.2023.
//

import Foundation
import Firebase

class FirestoreManager: ObservableObject {
    @Published var restaurant: String = ""
    
    init() {
        fetchRestaurant()
        fetchAllRestaurants()
    }
    
    func fetchRestaurant() {
        print("fetching data...")
        let db = Firestore.firestore()
        
        let docRef = db.collection("Restaurants").document("PizzaMania")
        
        docRef.getDocument { document, error in
            guard error == nil else {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("ONE DOC")
                    print("data", data)
                    self.restaurant = data["name"] as? String ?? ""
                }
            }
        }
    }
    
    func fetchAllRestaurants() {
        let db = Firestore.firestore()
        
        db.collection("Restaurants").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("ALL DOCUMENTS")
                    print("\(document.documentID): \(document.data())")
                }
            }
        }
    }
    
    func createRestaurant(restaurantName: String) {
        let db = Firestore.firestore()
        
        let docRef = db.collection("Restaurants").document(restaurantName)
        
        docRef.setData(["name": restaurantName]) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func updateRestaurant(restaurantName: String, restaurantAddress: String) {
        let db = Firestore.firestore()
        
        let docRef = db.collection("Restaurants").document(restaurantName)
        
        let docData: [String: Any] = [
            "name": restaurantName,
            "address": restaurantAddress,
        ]
        
        docRef.setData(docData, merge: true) { error in
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Document successfully updated!")
            }
        }
    }
}
