//
//  BoardCell.swift
//  Project3_WordGame
//
//  Created by Christian Purdy on 3/21/18.
//  Copyright © 2018 Christian Purdy. All rights reserved.
//

import UIKit

class BoardCell: UICollectionViewCell {
    
    var letter: UILabel
    var inWord: Bool
    
    override init(frame: CGRect) {
        letter = UILabel()
        inWord = false
        letter.textColor = UIColor.black
        letter.textAlignment = .center
        super.init(frame: frame)
        letter.frame = self.bounds
        letter.text = "A"
        self.addSubview(letter)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setLetter(lett: String)
    {
        letter.text = lett
    }
    
    func fingerOver() {
        self.backgroundColor = UIColor.yellow
    }
}
