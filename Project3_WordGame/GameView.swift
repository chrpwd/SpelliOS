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
    func alarmUpdated()
}

class GameView: UIView {
    
    weak var delegate: GameViewDelegate? = nil
    
    
    var blocks: [[CGRect]]
    var labels: [[UILabel]]
    var viewColors:[UIColor]
    let seaGreen = UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 1)
    let belizeBlue = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1)
    let flatPurple = UIColor(red: 155/255, green: 89/255, blue: 182/255, alpha: 1)
    let flatOrange = UIColor(red: 211/255, green: 84/255, blue: 0/255, alpha: 1)
    var lastLabel: UILabel
    var selectDirection: [Int]
    
    
    
    override init(frame: CGRect) {
        blocks = []
        labels = []
        viewColors = []
        viewColors.append(seaGreen)
        viewColors.append(belizeBlue)
        viewColors.append(flatOrange)
        viewColors.append(flatPurple)
        lastLabel = UILabel()
        selectDirection = [0, 0]
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        for row in labels {
            for label in row {
                self.addSubview(label)
            }
        }
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //get context, because we are in a draw function we know there will be a context and that it will be for this view
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        
        //draw rects
        for row in blocks {
            for rect in row {
                context.stroke(rect)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let touchLocation: CGPoint = touch.location(in: self)
        var label = UILabel()
        for (row, rects) in blocks.enumerated() {
            for rect in rects {
                let index = rects.index(of: rect)
                if rect.contains(touchLocation) {
                    label = labels[row][index!]
                    if(label.backgroundColor == backgroundColor) {
                        label.backgroundColor = UIColor.yellow
                        lastLabel = label
                    }
                    if(label.backgroundColor == UIColor.yellow && label != lastLabel) {
                        lastLabel.backgroundColor = backgroundColor
                        lastLabel = label
                        
                        
                    }
                    //unwrap optional
                    if let delegate = delegate {
                        delegate.userTouched(cell: label)
                    }
                }
            }
            
        }
    }
        
        //OVERRIDE touchesBegan, useful for unselecting cell
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            let touch: UITouch = touches.first!
            let touchLocation: CGPoint = touch.location(in: self)
            var label = UILabel()
            for (row, rects) in blocks.enumerated() {
                for rect in rects {
                    let index = rects.index(of: rect)
                    if rect.contains(touchLocation) {
                        label = labels[row][index!]
                        if(label.backgroundColor == backgroundColor) {
                            label.backgroundColor = UIColor.yellow
                        }
                        else {
                            label.backgroundColor = backgroundColor
                        }
                    }
                }
            }
            //unwrap optional
            if let delegate = delegate {
                delegate.userTouched(cell: label)
            }
        }
        
        //    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        //        let touch: UITouch = touches.first!
        //        let touchLocation: CGPoint = touch.location(in: self)
        //        var label = UILabel()
        //        for rect in blocks {
        //            let index = blocks.index(of: rect)
        //            if rect.contains(touchLocation) {
        //                label = labels[index!]
        //                if(label.backgroundColor == UIColor.clear) {
        //                    label.backgroundColor = UIColor.yellow
        //                }
        //                else {
        //                    label.backgroundColor = UIColor.clear
        //                }
        //            }
        //        }
        //
        //        print("Touched cell end")
        //
        //        //unwrap optional
        //        if let delegate = delegate {
        //            delegate.userTouched(cell: label)
        //        }
        //    }
        
}
