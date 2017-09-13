//
//  ViewController.swift
//  BatLogin
//
//  Created by Alan Casas on 31/8/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLogoBatman: UIImageView!
    
    @IBOutlet weak var labelInstructions: UILabel!
    
    var viewAnimator:UIViewPropertyAnimator!
    private let unlockGesturRecognizer = UIPanGestureRecognizer()
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        unlockGesturRecognizer.addTarget(self, action: #selector(handle(pan:)))
        self.viewIfLoaded?.addGestureRecognizer(unlockGesturRecognizer)
        
        viewAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: nil)
        viewAnimator.addAnimations{
            self.labelInstructions.layer.opacity = 0
            self.imgLogoBatman.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }
    }

    @objc func handle(pan: UIPanGestureRecognizer){
        let speed:CGFloat = 2.0
        
        switch pan.state {
        case .began:
            viewAnimator.pauseAnimation()
            
        case .changed:
            let translation = pan.translation(in: pan.view).y / speed
            viewAnimator.fractionComplete = translation / 100
            if viewAnimator.fractionComplete >= 0.99{
                buildAnimation()
            }
            
        default:
            break
        }
    }
    
    func buildAnimation(){
        let logoAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn) {
            self.imgLogoBatman.transform = CGAffineTransform(scaleX: 25.0, y: 25.0)
        }
        logoAnimator.startAnimation()
        logoAnimator.addCompletion { (UIViewAnimatingPosition) in
            self.beginApp()
        }
    }
    
    
    func beginApp(){
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
        self.present(loginViewController!, animated: true, completion: nil)
    }
}






















