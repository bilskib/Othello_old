//
//  Move.swift
//  Othello
//
//  Created by Bartosz on 16/06/2019.
//  Copyright © 2019 Bartosz Bilski. All rights reserved.
//

import GameplayKit

class Move: NSObject, GKGameModelUpdate {
    
    var coordinate: CGPoint
    
    // Required by GameplayKit
    var value: Int = 0
    
    init(_ coordinate: CGPoint) {
        self.coordinate = coordinate
    }
}
