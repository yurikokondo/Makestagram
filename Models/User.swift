//
//  Models.swift
//  Makestagram
//
//  Created by Yuriko Kondo on 2017/09/29.
//  Copyright © 2017年 Make School. All rights reserved.
//


import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase


struct UserService {
    static func create(_ firUser: FIRUser, username: String, completion: @escaping (User?) -> Void) {
        let userAttrs = ["username": username]
        
        let ref = Database.database().reference().child("users").child(firUser.uid)
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = User(snapshot: snapshot)
                completion(user)
            })
        }
    }
}
    // insert user-related networking code here

