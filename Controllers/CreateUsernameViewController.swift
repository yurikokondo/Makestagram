//
//  ViewController.swift
//  makestagram
//
//  Created by Yuriko Kondo on 2017/09/17.
//  Copyright © 2017年 Make School. All rights reserved.
//
import UIKit
import FirebaseAuth
import FirebaseDatabase
class CreateUsernameViewController: UIViewController {
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        UserService.create(firUser, username: username) { (user) in
            guard let _ = user else {
                return
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            
            if let initialViewController = storyboard.instantiateInitialViewController() {
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            }
}
}
}
