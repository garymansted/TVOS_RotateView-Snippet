//
//
//  LoginVC.swift
//  EOLDisplay
//
//  Created by Gary Mansted on 16/7/2022.
//

/*
 This is a sample ViewController provided for demonstration purposes.
 For simplicity, no login logic has been implemented.
 Its purpose is to demonstrate the main rotation setting,
 which is initialized at the start of the program - in this instance.
*/

import UIKit

class LoginVC: UIViewController {

    // MARK: - Vide Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set to what ever mode you'd like 
        setLandscapeMode()
    }

}

// END REGION


// MARK: - Class Extention
extension LoginVC {
    
    // MARK: - Set Portrait Mode
    private func setPortraitMode() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let keyWindow = windowScene.windows.first else {
            fatalError("Unable to retrieve the key window")
        }
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.width)
        keyWindow.frame = frame
        let transformRotation = CGAffineTransform(rotationAngle: CGFloat(-270) * .pi / 180)
        let x = (UIScreen.main.bounds.width - UIScreen.main.bounds.height) / 2
        let y = -x
        let transformTranslation = CGAffineTransform(translationX: x, y: y)
        keyWindow.transform = transformRotation.concatenating(transformTranslation)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeVCID") as? HomeVC {
            keyWindow.rootViewController = homeVC
            keyWindow.makeKeyAndVisible()
        } else {
            fatalError("Unable to instantiate HomeVC from storyboard")
        }
    }
    
    // MARK: - Set Landscape Mode
    private func setLandscapeMode() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let keyWindow = windowScene.windows.first else {
            fatalError("Unable to retrieve the key window")
        }
        keyWindow.transform = .identity // Reset any transformations
        keyWindow.frame = UIScreen.main.bounds
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeVCID") as? HomeVC {
            keyWindow.rootViewController = homeVC
            keyWindow.makeKeyAndVisible()
        } else {
            fatalError("Unable to instantiate HomeVC from storyboard")
        }
    }
    
}
