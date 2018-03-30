//
//  Gradient.swift
//  Project3_WordGame
//
//  Created by Christian Purdy on 3/4/18.
//  Copyright © 2018 Christian Purdy. All rights reserved.
//

import UIKit

class 
Gradient: UIView {
    
    let top = UIColor(red: 52/255, green: 172/255, blue: 224/255, alpha: 1)
    let bottom = UIColor(red: 112/255, green: 111/255, blue: 211/255, alpha: 1)
    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer}
    let gradientLocations: [Float] = [0.0, 0.5]
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    func updateColors() {
        gradientLayer.colors = [top.cgColor, bottom.cgColor]
        gradientLayer.locations = gradientLocations as [NSNumber]?
        gradientLayer.frame = bounds
    }
    
    override func layoutSubviews() {
        updateColors()
        super.layoutSubviews()
        
        
    }
    
}

