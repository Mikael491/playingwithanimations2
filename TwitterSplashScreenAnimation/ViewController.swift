//
//  ViewController.swift
//  TwitterSplashScreenAnimation
//
//  Created by Mikael Teklehaimanot on 10/22/16.
//  Copyright © 2016 Mikael Teklehaimanot. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    @IBOutlet weak var twitterFeed: UIImageView!
    
    var mask: CALayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set up mask
        self.mask = CALayer()
        self.mask?.contents = UIImage(named: "twitter logo mask")
        self.mask?.contentsGravity = kCAGravityResizeAspect
        self.mask?.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.mask?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.mask?.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
        
    }

}

