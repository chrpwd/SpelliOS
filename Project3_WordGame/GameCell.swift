//
//  GameCell.swift
//  Project3_WordGame
//
//  Created by Christian Purdy on 3/12/18.
//  Copyright © 2018 Christian Purdy. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {
    
    let Game: GameViewController
    let name: String
    let label: UILabel
    
    override init(frame: CGRect) {
        
        //layout for game controllers
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0.0005
        layout.minimumLineSpacing = 1
        
        Game = GameViewController()
        name = "Game \(Dataset.count)"
        label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        super.init(frame: frame)
        label.frame = self.bounds

        self.addSubview(label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
