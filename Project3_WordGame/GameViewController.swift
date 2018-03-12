//
//  GameViewController.swift
//  Project3_WordGame
//
//  Created by Christian Purdy on 2/26/18.
//  Copyright © 2018 Christian Purdy. All rights reserved.
//

import UIKit


class GameViewController: UIViewController {
    
    override func loadView() {
        self.view = GameView()
        view.backgroundColor = UIColor.white
        super.loadView()
    }
    
    

    
}
