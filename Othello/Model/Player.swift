//
//  Player.swift
//  Othello
//
//  Created by Bartosz on 16/06/2019.
//  Copyright © 2019 Bartosz Bilski. All rights reserved.
//

import GameplayKit

enum PieceColor: Int {
    case empty
    case black
    case white
    
    var name: String {
        switch self {
        case .empty:
            return ""
        case .black:
            return "black"
        case .white:
            return "white"
        }
    }
}

class Player: NSObject, GKGameModelPlayer {
 
    var color: PieceColor
    var name: String
    
    // Required by GameplayKit
    var playerId: Int
    
    static var allPlayers = [Player(.black), Player(.white)]
    
    var opponent: Player {
        if color == .black {
            return Player.allPlayers[1]
        } else {
            return Player.allPlayers[0]
        }
    }
    
    init(_ color: PieceColor){
        self.color = color
        name = color.name
        playerId = color.rawValue
    }
    
}
