//
//  Item.swift
//  TapPan
//
//  Created by Nhật Minh on 11/28/16.
//  Copyright © 2016 Nhật Minh. All rights reserved.
//

import UIKit

class Item: UIImageView, UIGestureRecognizerDelegate{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup()
    {
        self.isUserInteractionEnabled = true
        
        self.isMultipleTouchEnabled = true
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        panGesture.maximumNumberOfTouches = 1
        self.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchPhoto))
        self.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotateItem))
        rotateGesture.delegate = self
        self.addGestureRecognizer(rotateGesture)
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func rotateItem(_ rotateGestureRecognizer: UIRotationGestureRecognizer)
    {
        if let view = rotateGestureRecognizer.view
        {
            view.transform = view.transform.rotated(by: rotateGestureRecognizer.rotation)
            rotateGestureRecognizer.rotation = 0
        }
    }
    
    func pinchPhoto(_ pinchGestureRecognizer: UIPinchGestureRecognizer)
    {
        if let view = pinchGestureRecognizer.view
        {
            view.transform = view.transform.scaledBy(x: pinchGestureRecognizer.scale, y: pinchGestureRecognizer.scale)
            pinchGestureRecognizer.scale = 1
        }
    }
    
    func onPan(_ panGesture: UIPanGestureRecognizer)
    {
        if (panGesture.state == .began || panGesture.state == .changed )
        {
            let point = panGesture.location(in: self.superview)
            self.center = point 
        }
    }
}
