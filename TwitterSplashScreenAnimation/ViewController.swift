//
//  ViewController.swift
//  TwitterSplashScreenAnimation
//
//  Created by Mikael Teklehaimanot on 10/22/16.
//  Copyright © 2016 Mikael Teklehaimanot. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController, CAAnimationDelegate {
    
    @IBOutlet weak var twitterFeed: UIImageView!
    
    var mask: CALayer?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set up mask
        self.mask = CALayer()
        self.mask?.contents = UIImage(named: "twitter logo mask")?.cgImage
        self.mask?.contentsGravity = kCAGravityResizeAspect
        self.mask?.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.mask?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.mask?.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
        
        self.twitterFeed.layer.mask = mask!
        
        self.view.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        
        animate()
        
    }
    
    func animate() {
        
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 1
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 1
        
        //initial, middle, final animation values
        let initial = NSValue(cgRect: (mask?.bounds)!)
        let middle = NSValue(cgRect: CGRect(x: 0, y: 0, width: 90, height: 90))
        let final = NSValue(cgRect: CGRect(x: 0, y: 0, width: 2200, height: 2200))
        
        //assign to key frame values and key times
        keyFrameAnimation.values = [initial, middle, final]
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        
        //animation time functions
            keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)]
        
        self.mask?.add(keyFrameAnimation, forKey: "bounds")
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.twitterFeed.layer.mask = nil
    }

}

