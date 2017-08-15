//
//  CurvedLineView.swift
//  FacebookLiveStreamLikeAnimation
//
//  Created by Thai Cao Ngoc on 29/3/17.
//  Copyright © 2017 Thai Cao Ngoc. All rights reserved.
//

import UIKit

class CurvedLineView: UIView {

    func curvedPath() -> UIBezierPath {
        let curvedPath = UIBezierPath()
        let startPoint = CGPoint(x: -30 , y: self.frame.width/16*10.3)
        let endPoint = CGPoint(x: self.frame.width + 30, y: self.frame.width/16*8.5)
        let controlPoint1 = CGPoint(x: self.frame.width/3, y: self.frame.width/16*1 - CGFloat(drand48()*200))
        let controlPoint2 = CGPoint(x: self.frame.width/3*2, y: self.frame.width/16*15 + CGFloat(drand48()*200))
        
        curvedPath.move(to: startPoint)
        curvedPath.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        curvedPath.lineWidth = 3
        return curvedPath
    }

    override func draw(_ rect: CGRect) {
        curvedPath().stroke()
    }
}
