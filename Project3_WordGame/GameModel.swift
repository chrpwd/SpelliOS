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
    
    //2D array
    var board: [[String]] = [[]]
    weak var delegate: GameModelDelegate? = nil
    
    func getData() {
        
        delegate?.receiveUpdate()
    }
    
    init() {
        //calculate all rects to hold letters
        for h in 0...11
        {
            let row: [String] = []
            board.append(row)
            for _ in 0...8{
                let str = ""
                board[h].append(str)
            }
        }
        setBlackRects()
        getWord()
    }
    
    func setBlackRects() {
        for _ in 0...3 {
            let randRow = Int(arc4random_uniform(UInt32(11)))
            let randCol = Int(arc4random_uniform(UInt32(8)))
            print("BLACK SQUARE AT ", randRow, randCol)
            board[randRow][randCol] = "0"

        }
    }
    
    //IMPORTANT!
    //function gets a word than adds word into the 2d board array.
    func getWord() {
        
        var wordsString: String = ""
        while wordsString.count < 94 {
            let randomIndex = Int(arc4random_uniform(UInt32(Dictionary.words.count)))
            let addString = Dictionary.words[randomIndex]
            if !(wordsString.count + addString.count > 94) && (addString.count > 0) && (wordsString.count + addString.count != 93) {
                wordsString = wordsString + addString
                print("COUNT", wordsString.count)
                wordPath(word: addString)
            }
        }
        
    }
    
    //adds path of word in the 2d board array
    func wordPath(word: String) {
        var chars: [Character] = []
        var adjacentRow: [Int] = [-1, 0, 1]
        var adjacentCol: [Int] = [-1, 0, 1]
        
        //put chars in word into array
        for c in word {
            chars.append(c)
        }
        
        var row = Int(arc4random_uniform(UInt32(11)))
        var col = Int(arc4random_uniform(UInt32(8)))
        
        var nextRow: Int = 0
        var nextCol: Int = 0
        
        var neighborRowCount = 0
        var neighborColCount = 0
        
        for i in (0...chars.count - 1) {
            
            if i == 0 {
                while !board[row][col].isEmpty {
                    row = Int(arc4random_uniform(UInt32(11)))
                    col = Int(arc4random_uniform(UInt32(8)))
                }
                board[row][col] = String(chars[0])
            }
            else {
                adjacentRow = rowCheck(row: row)
                adjacentCol = colCheck(col: col)
                neighborRowCount = rowNeighbors(row: row)
                neighborColCount = colNeighbors(col: col)
                
                let neighbors = (neighborRowCount * neighborColCount) - 1
                
                
                var tryCount: Int = 0
                nextRow = Int(arc4random_uniform(UInt32(adjacentRow.count)))
                nextCol = Int(arc4random_uniform(UInt32(adjacentCol.count)))
                while !board[row + adjacentRow[nextRow]][col + adjacentCol[nextCol]].isEmpty {
                    if tryCount < neighbors
                    {
                        adjacentRow = rowCheck(row: row)
                        adjacentCol = colCheck(col: col)
                        nextRow = Int(arc4random_uniform(UInt32(adjacentRow.count)))
                        nextCol = Int(arc4random_uniform(UInt32(adjacentCol.count)))
                        tryCount += 1
                    }
                    else {
                        placeFindBlank(char: chars[i])
                        break;
                    }
                }
                row = row + adjacentRow[nextRow]
                col = col + adjacentCol[nextCol]
                board[row][col] = String(chars[i])
            }
        }
        
    }
    //find blank space to put spare letters on board
    func placeFindBlank(char: Character) {
        for r in 0...11 {
            for c in 0...8 {
                if board[r][c].isEmpty {
                    board[r][c] = String(char)
                    return
                }
            }
        }
    }
    
    //check if row is first or last row on screen to find neighbors
    func rowCheck(row: Int) -> [Int] {
        let allRows: [Int] = [-1, 0, 1]
        let zeroRow: [Int] = [0, 1]
        let maxRow: [Int] = [0, -1]
        
        if row == 0 {
            return zeroRow
        }
            
        else if row == 11 {
            return maxRow
        }
            
        else {
            return allRows
        }
        
    }
    //check if col is first or last on screen to find neighbors
    func colCheck(col: Int)-> [Int] {
        let allCols: [Int] = [-1, 0, 1]
        let zeroCol: [Int] = [0, 1]
        let maxCol: [Int] = [0, -1]
        
        if col == 0 {
            return zeroCol
        }
            
        else if col == 8 {
            return maxCol
        }
            
        else {
            return allCols
        }
    }
    
    func colNeighbors(col: Int)-> Int {
        
        if col == 0 || col == 11 {
            return 2
        }
            
        else {
            return 3
        }
    }
    
    func rowNeighbors(row: Int)-> Int {
        
        if row == 0 || row == 8 {
            return 2
        }
            
        else {
            return 3
        }
    }
}
