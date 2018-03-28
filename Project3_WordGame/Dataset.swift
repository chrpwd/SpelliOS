//
//  Dataset.swift
//  Project3_WordGame
//
//  Created by Christian Purdy on 3/8/18.
//  Copyright © 2018 Christian Purdy. All rights reserved.
//

import Foundation

protocol DatasetDelegate: class {
    var delegateID: String { get }
    func datasetUpdated()
}

final class Dataset {
    final class Entry {
        let game: GameModel
        let name: String
        let score: Int
        
        init(name: String, game: GameModel, score: Int) {
            self.name = name
            self.game = game
            self.score = score
        }
    }
    
    /** static dataset means data will never be released therefore use weak delegates for data
     so that the delegates can be released (wont be referenced by the static dataset)
     **/
    private final class WeakDatasetDelegate {
        weak var delegate: DatasetDelegate?
        
        init(delegate: DatasetDelegate) {
            self.delegate = delegate
        }
    }
    
    private static var delegates: [String: WeakDatasetDelegate] = [:]
    private static var games: [GameCell] = []
    
    static func registerDelegate(_ delegate: DatasetDelegate) {
        delegates[delegate.delegateID] = WeakDatasetDelegate(delegate: delegate)
    }
    
    //add alarm to list of games in table
    static func appendEntry(_ newGame: GameCell) {
        games.append(newGame)
        delegates.values.forEach({ (weakDelegate: WeakDatasetDelegate) in weakDelegate.delegate?.datasetUpdated()
            
        })
    }
    
    //
    static func getEntry(atIndex index: Int)-> GameCell {
        var entry: GameCell?
        
        entry = games[index]
        
        return entry!
    }
    
    //returns the number of games in the alarms array
    static var count: Int {
        var count: Int = 0
        count = games.count
        return count
    }
    
}
