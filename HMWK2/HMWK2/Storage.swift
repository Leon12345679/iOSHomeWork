//
//  Storagw.swift
//  HMWK2
//
//  Created by Leon Vladimirov on 10/8/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

import Foundation


/// UserDefaults wrapper that allows safe reading and writing of generic types
class Storage<T> {

    enum StorageErrors: Error, LocalizedError {
        case readError
        
        var errorDescription: String? {
            switch self {
            case .readError:
                return "Storgae: Failed to read value for key"
            }
        }
    }
    
    
    public static func write(_ value: T, forKey: String) {
        UserDefaults.standard.set(value, forKey: forKey)
    }
    
    public static func read(value forKey: String) -> Result<Any, Error> {
        do {
            let fetchedData = try fetchObjectFromDefaults(forKey)
            return .success(fetchedData)
            
        } catch(let error) {
            return .failure(error)
        }
    }
    
    private static func fetchObjectFromDefaults(_ forKey: String) throws -> Any {
        if let fetchedObject = UserDefaults.standard.object(forKey: forKey) {
            return fetchedObject
        } else {
            throw StorageErrors.readError
        }
    }
}
