//
//  ViewController.swift
//  SigmaStory
//
//  Created by Nessie Reema S on 27/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "storyBackground")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        let overlay = UIView(frame: self.view.bounds)
        overlay.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        self.view.addSubview(overlay)
        self.view.insertSubview(overlay, aboveSubview: backgroundImage)
    
    }
    
}

