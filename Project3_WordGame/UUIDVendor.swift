//
//  UUIDVendor.swift
//  Project3_WordGame
//
//  Created by Christian Purdy on 3/12/18.
//  Copyright © 2018 Christian Purdy. All rights reserved.
//

import Foundation

final class UUIDVendor {
    private static var existingUUIDs: Set<String> = Set<String>()
    //private static var UUIDsLock: Locks.Lock = Locks.Lock()
    
    static func vendUUID() -> String {
        var UUIDString = UUID().uuidString
        //  Locks.synchronized(lock: UUIDsLock) {
        while(!existingUUIDs.insert(UUIDString).inserted) {
            UUIDString = UUID().uuidString
        }
        //}
        return UUIDString
    }
}
