//
//  LoginViewController.swift
//  Makestagram
//
//  Created by Yuriko Kondo on 2017/09/17.
//  Copyright © 2017年 Make School. All rights reserved.
//


import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase




typealias FIRUser = FirebaseAuth.User




class LoginViewController: UIViewController {
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // 1
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        // 2
        authUI.delegate = self
        
        // 3
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
        
        print("tapped")
    }

    
    
    // ...
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
            if let _ = User(snapshot: snapshot) {
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                
                if let initialViewController = storyboard.instantiateInitialViewController() {
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
            } else {
                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
            }
        })
        // ...
       }
}

