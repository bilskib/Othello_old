//
//  Board.swift
//  Othello
//
//  Created by Bartosz on 27/05/2019.
//  Copyright © 2019 Bartosz Bilski. All rights reserved.
//

import GameplayKit

struct Board: GKGameModel {
    
    let rows: Int, columns: Int
    var grid: [PieceColor]
    var currentPlayer = Player.allPlayers[0]
    
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
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
}

extension Board {

}
