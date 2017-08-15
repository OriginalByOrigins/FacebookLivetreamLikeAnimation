//
//  ViewController.swift
//  FacebookLiveStreamLikeAnimation
//
//  Created by Thai Cao Ngoc on 29/3/17.
//  Copyright © 2017 Thai Cao Ngoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Youtube Background image"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let curvedLineView = CurvedLineView()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addBackgroundImage()
        addCurvedLine()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addEmojies)))
    }
    
    func addEmojies() {
        for _ in (0...5) {
            addEmoji()
        }
    }
    
    func addBackgroundImage() {
        self.view.addSubview(backgroundImageView)
        backgroundImageView.frame = self.view.frame
    }
    
    func addCurvedLine() {
        curvedLineView.frame = self.view.frame
        self.view.addSubview(curvedLineView)
        curvedLineView.alpha = 0
    }
    
    func addEmoji() {
        let emojiImageView: UIImageView = getImage()
        emojiImageView.contentMode = .scaleAspectFill
        let dimension = 18 + drand48()*10
        emojiImageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        self.view.addSubview(emojiImageView)
        addAnimation(to: emojiImageView)
    }
    
    func getImage() -> UIImageView {
        let randomNumber = drand48()*6
        if randomNumber < 1 {
            return UIImageView(image: #imageLiteral(resourceName: "like"))
        } else if randomNumber < 2 {
            return UIImageView(image: #imageLiteral(resourceName: "love"))
        } else if randomNumber < 3 {
            return UIImageView(image: #imageLiteral(resourceName: "haha"))
        } else if randomNumber < 4 {
            return UIImageView(image: #imageLiteral(resourceName: "wow"))
        } else if randomNumber < 5 {
            return UIImageView(image: #imageLiteral(resourceName: "sad"))
        } else {
            return UIImageView(image: #imageLiteral(resourceName: "angry"))
        }
    }
    
    func addAnimation(to emojiImageView: UIImageView) {
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        animation.path = curvedLineView.curvedPath().cgPath
        animation.duration = 2 + drand48()*3
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        emojiImageView.layer.add(animation, forKey: nil)
    }
}

