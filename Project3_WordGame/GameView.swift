//
//  GameView.swift
//  Project3_WordGame
//
//  Created by Christian Purdy on 2/26/18.
//  Copyright © 2018 Christian Purdy. All rights reserved.
//

import UIKit

class GameView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.frame = self.bounds
        print("VIEWZ")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //get context, because we are in a draw function we know there will be a context and that it will be for this view
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        //draw gameboard vertical lines
        context.move(to: CGPoint(x: bounds.width * 0.111, y: 0))
        context.addLine(to: CGPoint(x: bounds.width/9, y: bounds.height))
        context.strokePath()
        
        context.move(to: CGPoint(x: bounds.width * 0.222, y: 0))
        context.addLine(to: CGPoint(x: bounds.width * 0.222, y: bounds.height))
        context.strokePath()
        
        context.move(to: CGPoint(x: bounds.width * 0.333, y: 0))
        context.addLine(to: CGPoint(x: bounds.width * 0.333, y: bounds.height))
        context.strokePath()
        
        context.move(to: CGPoint(x: bounds.width * 0.444, y: 0))
        context.addLine(to: CGPoint(x: bounds.width * 0.444, y: bounds.height))
        context.strokePath()
        
        context.move(to: CGPoint(x: bounds.width * 0.555, y: 0))
        context.addLine(to: CGPoint(x: bounds.width * 0.555, y: bounds.height))
        context.strokePath()
        
        context.move(to: CGPoint(x: bounds.width * 0.666, y: 0))
        context.addLine(to: CGPoint(x: bounds.width * 0.666, y: bounds.height))
        context.strokePath()
        
        context.move(to: CGPoint(x: bounds.width * 0.777, y: 0))
        context.addLine(to: CGPoint(x: bounds.width * 0.777, y: bounds.height))
        context.strokePath()
        
        context.move(to: CGPoint(x: bounds.width * 0.888, y: 0))
        context.addLine(to: CGPoint(x: bounds.width * 0.888, y: bounds.height))
        context.strokePath()
        
        //draw gameboard horizontal lines
        context.move(to: CGPoint(x: 0, y: bounds.height * 0.083))
        context.addLine(to: CGPoint(x: bounds.width, y: bounds.height * 0.083))
        context.strokePath()
        
        context.move(to: CGPoint(x: 0, y: bounds.height * 0.1666))
        context.addLine(to: CGPoint(x: bounds.width, y: bounds.height * 0.1666))
        context.strokePath()
        
        context.move(to: CGPoint(x: 0, y: bounds.height * 0.25))
        context.addLine(to: CGPoint(x: bounds.width, y: bounds.height * 0.25))
        context.strokePath()
        
        context.move(to: CGPoint(x: 0, y: bounds.height * 0.333))
        context.addLine(to: CGPoint(x: bounds.width, y: bounds.height * 0.333))
        context.strokePath()
        
        context.move(to: CGPoint(x: 0, y: bounds.height * 0.416))
        context.addLine(to: CGPoint(x: bounds.width, y: bounds.height * 0.416))
        context.strokePath()
        
        context.move(to: CGPoint(x: 0, y: bounds.height * 0.5))
        context.addLine(to: CGPoint(x: bounds.width, y: bounds.height * 0.5))
        context.strokePath()
        
        context.move(to: CGPoint(x: 0, y: bounds.height * 0.583))
        context.addLine(to: CGPoint(x: bounds.width, y: bounds.height * 0.583))
        context.strokePath()
        
        context.move(to: CGPoint(x: 0, y: bounds.height * 0.666))
        context.addLine(to: CGPoint(x: bounds.width, y: bounds.height * 0.666))
        context.strokePath()
        
        context.move(to: CGPoint(x: 0, y: bounds.height * 0.75))
        context.addLine(to: CGPoint(x: bounds.width, y: bounds.height * 0.75))
        context.strokePath()
        
        context.move(to: CGPoint(x: 0, y: bounds.height * 0.833))
        context.addLine(to: CGPoint(x: bounds.width, y: bounds.height * 0.833))
        context.strokePath()
        
        context.move(to: CGPoint(x: 0, y: bounds.height * 0.916))
        context.addLine(to: CGPoint(x: bounds.width, y: bounds.height * 0.916))
        context.strokePath()
    }
    
}
