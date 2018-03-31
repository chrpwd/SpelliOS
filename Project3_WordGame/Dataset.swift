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
    final class Entry: Codable {
        
        let game: GameCell
        init(game: GameCell) {
         self.game = game
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
    
    private static let entriesEncoder: JSONEncoder = {
        let entriesEncoder = JSONEncoder()
        entriesEncoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        return entriesEncoder
    }()
    private static var delegates: [String: WeakDatasetDelegate] = [:]
    private static var entries: [Entry] = loadData()
    
    static func registerDelegate(_ delegate: DatasetDelegate) {
        delegates[delegate.delegateID] = WeakDatasetDelegate(delegate: delegate)
    }
    
    private static func saveData() {
        
        guard
            let fileURL: URL = try? FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("iOSDataset.json", isDirectory: false),
            let encodedDataset: Data = try? entriesEncoder.encode(entries)
        else {
            return
        }
        do {
            try encodedDataset.write(to: fileURL, options: [.atomic, .completeFileProtection])
            print(fileURL.absoluteString)
           // print(String(data: encodedDataset, encoding: .utf8) ?? "")
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
    
    private static func loadData()->[Entry] {
        var data:[Entry] = []
        guard
            let fileURL: URL = try? FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("iOSDataset.json", isDirectory: false),
            let encodedDataset: Data = try? Data(contentsOf: fileURL, options: [])
        else {
            return data
        }
        do {
            data = try JSONDecoder().decode([Entry].self, from: encodedDataset)
            print(fileURL.absoluteString)
            //print(String(data: encodedDataset, encoding: .utf8) ?? "")
        }
        catch {
            print(error.localizedDescription)
        }
        return data
    }
    
    //add alarm to list of games in table
    static func appendEntry(_ newGame: GameCell) {
        let entry = Entry(game: newGame)
        entries.append(entry)
        delegates.values.forEach({ (weakDelegate: WeakDatasetDelegate) in weakDelegate.delegate?.datasetUpdated()
        })
        saveData()
    }
    
    //
    static func getEntry(atIndex index: Int)-> GameCell {
        var entry: Entry
        entry = entries[index]
        return entry.game
    }
    
    static func editEntry(atIndex index: Int, newEntry entry: Entry) {
        entries[index] = entry
        delegates.values.forEach({ (weakDelegate: WeakDatasetDelegate) in weakDelegate.delegate?.datasetUpdated()})
        saveData()
    }
    
    //returns the number of games in the alarms array
    static var count: Int {
        var count: Int = 0
        count = entries.count
        return count
    }
    
}
