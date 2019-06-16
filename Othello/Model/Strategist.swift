//
//  Strategist.swift
//  Othello
//
//  Created by Bartosz on 16/06/2019.
//  Copyright © 2019 Bartosz Bilski. All rights reserved.
//

import GameplayKit

struct Strategist {
    
    private let strategist: GKMinmaxStrategist = {
        let strategist = GKMinmaxStrategist()
        
        // Adding random source
        let sharedRandomSource = GKRandomSource.sharedRandom()
        let arc4RandomSource = GKARC4RandomSource() // balanced speed & randomness
        let linearCongruential = GKLinearCongruentialRandomSource() // faster, less random
        let mersenneTwister = GKMersenneTwisterRandomSource() // slower, more random
        
        strategist.randomSource = arc4RandomSource
        strategist.maxLookAheadDepth = 3
        
        return strategist
    }()
    
    /* Point the minmax strategist’s gameModel property at the instance of your game model class (that is, your class that implements the GKGameModel protocol) representing the current state of the game in play.
     */
    var board: Board {
        didSet {
            strategist.gameModel = board
        }
    }
    
    func bestCoordinate() -> CGPoint? {
        if let move = strategist.bestMove(for: board.currentPlayer) as? Move {
            return move.coordinate
        }
        
        return nil
    }
}
