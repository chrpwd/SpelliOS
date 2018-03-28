//
//  GameViewController.swift
//  Project3_WordGame
//
//  Created by Christian Purdy on 2/26/18.
//  Copyright © 2018 Christian Purdy. All rights reserved.
//

import UIKit


class GameViewController: UIViewController, GameViewDelegate, GameModelDelegate  {

    
    private var model = GameModel()
    
    private var game: GameView {
        return view as! GameView
    }
    
    
    convenience init(gameModel: GameModel) {
        self.init()
        self.model = gameModel
        model.delegate = self
        game.backgroundColor = game.viewColors[Int(arc4random_uniform(UInt32(4)))]

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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.delegate = self
        model.getData()
        model.getDictionary()
        model.getWord()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        calculateViewCells()
        getRandomCell()

    }
    
    func getRandomCell() {
        let randomIndex = Int(arc4random_uniform(UInt32(game.labels.count)))
        print(game.labels[randomIndex].text!)
    }
    
    //calculate rects, and labels to be used inside the view
    func calculateViewCells() {
        //calculate all rects to hold letters
        for h in 0...11{
            for w in 0...8{
                let rect = CGRect(x: (view.bounds.width/9) * CGFloat(w), y: (view.bounds.height/12) * CGFloat(h), width: view.bounds.width/9, height: view.bounds.height/12)
                game.blocks.append(rect)
            }
        }
        
        //draw rects
        for rect in game.blocks {
            let label = UILabel(frame: rect)
            label.textColor = UIColor.black
            label.textAlignment = .center
            label.text = String(game.labels.count)
            label.backgroundColor = game.backgroundColor
            game.labels.append(label)
        }

    }
    
    func addWord(word: String) {
        
    }
    
    //game model delegate
    func receiveUpdate() {
        
    }
    
    //view delegate method
    func userTouched(cell: UILabel) {
        print(cell.text)
    }
    
    //view delegate method
    func alarmUpdated() {
        
    }


    
}
