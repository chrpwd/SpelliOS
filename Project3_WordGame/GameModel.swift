//
//  GameModel.swift
//  Project3_WordGame
//
//  Created by Christian Purdy on 2/26/18.
//  Copyright © 2018 Christian Purdy. All rights reserved.
//

import UIKit

protocol GameModelDelegate: class {
    func receiveUpdate();
}
class GameModel {
    
    private var words = [String]()
    private var games = [GameView]()
    weak var delegate: GameModelDelegate? = nil

    func getData() {
        
        delegate?.receiveUpdate()
    }
    
    
    func getDictionary()
    {
        if let path = Bundle.main.path(forResource: "Dictionary", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                words = data.components(separatedBy: .newlines)
            } catch {
                print(error)
            }
        }
    }
    
    func getWord() {
        let randomIndex = Int(arc4random_uniform(UInt32(words.count)))
        print(words[randomIndex])
        
    }
    
}
