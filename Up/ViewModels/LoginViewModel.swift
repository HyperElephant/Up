//
//  LoginViewModel.swift
//  Up
//
//  Created by David Taylor on 5/21/17.
//  Copyright © 2017 Hyper Elephant. All rights reserved.
//

import ReactiveCocoa
import ReactiveSwift
import Result
import Firebase

class LoginViewModel: NSObject {
    
    let ref:FIRDatabaseReference!
    
    override init() {
        ref = FIRDatabase.database().reference()
    }
    
    func login(email: String, password: String, completed: @escaping (String!) -> Void){
        // [START headless_email_auth]
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password)
        { (user, error) in
            // [START_EXCLUDE]
            completed(error?.localizedDescription)
            // [END_EXCLUDE]
        }
        // [END headless_email_auth]
    }

}
