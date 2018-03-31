//
//  GameViewController.swift
//  Project3_WordGame
//
//  Created by Christian Purdy on 2/26/18.
//  Copyright © 2018 Christian Purdy. All rights reserved.
//

import UIKit


class GameViewController: UIViewController, GameViewDelegate, GameModelDelegate {
    
    private var model = GameModel()
    
    private var game: GameView {
        return view as! GameView
    }
    
    
    convenience init(gameModel: GameModel) {
        self.init()
        self.model = gameModel
        model.delegate = self
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func loadView() {
        super.loadView()
        view = GameView()
        self.edgesForExtendedLayout = [];
        model.getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        calculateRects()
        calculateViewCells()
        
    }
    
    func calculateRects() {
        //calculate all rects to hold letters
        for h in 0...11{
            var row: [CGRect] = []
            for w in 0...8{
                let rect = CGRect(x: (view.bounds.width/9) * CGFloat(w), y: (view.bounds.height/12) * CGFloat(h), width: view.bounds.width/9, height: view.bounds.height/12)
                row.append(rect)
            }
            game.blocks.append(row)
        }
        
        //for labels 2d array
        for h in 0...11{
            var row: [UILabel] = []
            for w in 0...8{
                let rect = CGRect(x: (view.bounds.width/9) * CGFloat(w), y: (view.bounds.height/12) * CGFloat(h), width: view.bounds.width/9, height: view.bounds.height/12)
                let label = UILabel(frame: rect)
                row.append(label)
            }
            game.labels.append(row)
        }
        
    }
    
    //calculate rects, and labels to be used inside the view
    func calculateViewCells() {
        
        //label subviews
        for r in 0...11 {
            var labelRow: [UILabel] = []
            for c in 0...8 {
                let label = game.labels[r][c]
                if(model.board[r][c] == "0")
                {
                    label.backgroundColor = UIColor.black
                    label.text = ""
                    label.textColor = UIColor.black
                }
                else {
                    label.textColor = UIColor.black
                    label.textAlignment = .center
                    label.text = model.board[r][c]
                    label.backgroundColor = game.backgroundColor
                }
                labelRow.append(label)
                
            }
            game.labels[r] = labelRow
            
        }
        
    }
    
    //game model delegate
    func receiveUpdate() {
    }
    
    func foundWord() {
        let selected = game.selectLabels
        print("FOUND WORD CONTROLLER", selected)
        for r in 0...11 {
            for c in 0...8 {
                for label in selected {
                    if game.labels[r][c].frame == label.frame {
                        self.model.board[r][c] = ""
                    }
                }
            }
        }
        
    }
    
    //view delegate method
    func userTouched(cell: UILabel) {
        print("SELECTED", game.currentSelected)
        model.checkIsWord(wordArray: game.currentSelected)
        game.currentSelected = []
        game.selectLabels = []
        calculateViewCells()
    }
    
    //view delegate method
    func alarmUpdated() {
        
    }
    
    
    
}
