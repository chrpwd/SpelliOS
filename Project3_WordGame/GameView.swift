//
//  GameView.swift
//  Project3_WordGame
//
//  Created by Christian Purdy on 2/26/18.
//  Copyright © 2018 Christian Purdy. All rights reserved.
//

import UIKit

protocol GameViewDelegate: AnyObject {
    func userTouched(cell: UILabel)
}

class GameView: UIView{
    
    var blocks:[CGRect]
    var labels:[UILabel]
        
    override init(frame: CGRect) {
        blocks = []
        labels = []
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //get context, because we are in a draw function we know there will be a context and that it will be for this view
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        //calculate all rects to hold letters
        for h in 0...11{
            for w in 0...8{
                let rect = CGRect(x: (self.bounds.width/9) * CGFloat(w), y: (self.bounds.height/12) * CGFloat(h), width: self.bounds.width/9, height: self.bounds.height/12)
                blocks.append(rect)
            }
        }
        //draw rects
        for rect in blocks {
            context.stroke(rect)
            let label = UILabel(frame: rect)
            label.textColor = UIColor.black
            label.textAlignment = .center
            label.text = String(labels.count)
            label.backgroundColor = UIColor.clear
            self.addSubview(label)
            labels.append(label)
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let touchLocation: CGPoint = touch.location(in: self)
        for rect in blocks {
            let index = blocks.index(of: rect)
            if rect.contains(touchLocation) {
                let label = labels[index!]
                if(label.backgroundColor == UIColor.clear) {
                    label.backgroundColor = UIColor.yellow
                }
                
            }
        }
        
    }
}
