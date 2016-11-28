//
//  ViewController.swift
//  TapPan
//
//  Created by Nhật Minh on 11/28/16.
//  Copyright © 2016 Nhật Minh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(tapGesture)
        
    }

    func onTap(tapGesture: UITapGestureRecognizer)
    {
        
        let point = tapGesture.location(in: self.view)
        let blossom = UIImageView(image: UIImage(named: "cherry blossom.png"))
        blossom.bounds.size = CGSize(width: 20, height: 20)
        blossom.center = point
        self.view.addSubview(blossom)
        
    }
}

