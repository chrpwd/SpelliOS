//
//  GameCell.swift
//  Project3_WordGame
//
//  Created by Christian Purdy on 3/12/18.
//  Copyright © 2018 Christian Purdy. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell, scoreDelegate, Codable {
    
    enum CodingKeys: String, CodingKey {
        case Game
        case name
        case index
        case score
    }
    
    let Game: GameModel
    var name: String
    var score: Int = 0
    let label: UILabel = UILabel()
    final let index: Int
    
    
    override init(frame: CGRect) {
        
        //layout for game controllers
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0.0005
        layout.minimumLineSpacing = 1
        index = Dataset.count
        
        Game = GameModel()
        name = "Game \(Dataset.count)"
        
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = name

        //super init call
        super.init(frame: frame)
        Game.scoreDel = self
        label.frame = self.bounds

        self.addSubview(label)
        
    }
    
    required init(from decoder: Decoder) throws {
        let decodingContainer: KeyedDecodingContainer<CodingKeys> = try
            decoder.container(keyedBy: CodingKeys.self)
        Game = try decodingContainer.decode(GameModel.self, forKey: .Game)
        name = try decodingContainer.decode(String.self, forKey: .name)
        index = try decodingContainer.decode(Int.self, forKey: .index)
        score = try decodingContainer.decode(Int.self, forKey: .score)
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        Game.scoreDel = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateScore() {
        score += 10
        let entry = Dataset.Entry(game: self)
        print("UPDATE INDEX", index)
        Dataset.editEntry(atIndex: index, newEntry: entry)
        


    }
    
}
