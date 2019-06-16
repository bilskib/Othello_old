//
//  Board.swift
//  Othello
//
//  Created by Bartosz on 27/05/2019.
//  Copyright © 2019 Bartosz Bilski. All rights reserved.
//

import GameplayKit

class Board: NSObject {

    let rows = 8, columns = 8
    var grid: [PieceColor]
    var currentPlayer = Player.allPlayers[0]
    
    override init() {
        grid = Array(repeating: .empty, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> PieceColor {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range!")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range!")
            grid[(row * columns) + column] = newValue
        }
    }
    
    func canMove(at position: CGPoint) -> Bool {
        //TODO: Rework this method according to game rules
        if self[Int(position.x), Int(position.y)] == .empty {
            return true
        } else {
            return false
        }
    }
}

extension Board: GKGameModel {
    
    // MARK: GKGameModel
    var players: [GKGameModelPlayer]? {
        return Player.allPlayers
    }
    
    var activePlayer: GKGameModelPlayer? {
        return currentPlayer
    }
    
    func setGameModel(_ gameModel: GKGameModel) {
        if let board = gameModel as? Board {
            grid = board.grid
        }
    }
    
    func isWin(for player: GKGameModelPlayer) -> Bool {
//        guard let player = player as? Player else {
//            return false
//        }
        // TODO: Add isWin logic - check for win conditions
        
        //let pieceColor = (player as! Player).color
        //var pieceColorCounter = 0
        
//        for row in 0..<rows {
//            for column in 0..<columns {
//                if .... == pieceColor {
//                    pieceColorCounter += 1
//                }
//            }
//        }
        return false
    }
    
    func gameModelUpdates(for player: GKGameModelPlayer) -> [GKGameModelUpdate]? {
        guard let player = player as? Player else {
            return nil
        }
        
        if isWin(for: player){
            return nil
        }
        
        var moves = [Move]()
        
        for row in 0..<rows {
            for column in 0..<columns {
                let position = CGPoint(x: row, y: column)
                if canMove(at: position) {
                    moves.append(Move(position))
                }
            }
        }
        return moves
    }
    
    
    func apply(_ gameModelUpdate: GKGameModelUpdate) {
        guard let move = gameModelUpdate as? Move else {
            return
        }
        
        self[Int(move.coordinate.x), Int(move.coordinate.y)] = currentPlayer.color
        currentPlayer = currentPlayer.opponent
    }
    
    func score(for player: GKGameModelPlayer) -> Int {
        // TODO: Rework score function maybe?
        guard let player = player as? Player else {
            return 0
        }
        
        if isWin(for: player){
            return 1
        } else {
            return 0
        }
    }
    
    // MARK: NSCopying
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Board()
        copy.setGameModel(self)
        return copy
    }
}
