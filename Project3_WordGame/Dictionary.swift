//
//  Dictionary.swift
//  
//
//  Created by Christian Purdy on 3/30/18.
//

import Foundation

final class Dictionary {
    
    static var words:[String] = []
    
    init() {
        getDictionary()
    }
    
    //upload the dictionary file into array
    func getDictionary()
    {
        if let path = Bundle.main.path(forResource: "Dictionary", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                Dictionary.words = data.components(separatedBy: .newlines)
            } catch {
                print(error)
            }
        }
    }
}
