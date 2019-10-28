//
//  DataSourceUpdateProtocol.swift
//  HMWK3
//
//  Created by Leon Vladimirov on 10/28/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

import Foundation


protocol DataSourceChange {
    func updateDataSource(dataPath: IndexPath, newVal: String)
}
