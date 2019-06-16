//
//  Game.swift
//  Othello
//
//  Created by Bartosz on 27/05/2019.
//  Copyright © 2019 Bartosz Bilski. All rights reserved.
//

import Foundation

class Othello {
    
    var board = Board(rows: 8, columns: 8)
    
    func setInitialBoard() {
        board[3,3] = .white
        board[4,4] = .white
        board[3,4] = .black
        board[4,3] = .black
    }
    
    // Helper methods
    func clear() {
        for row in 0..<board.rows {
            for column in 0..<board.columns {
                self.board[row, column] = .empty
            }
        }
    }
    
    func printB() {
        for row in 0..<board.rows {
            for column in 0..<board.columns {
                print("position(",row, ",",column,")", " has value:", self.board[row, column])
            }
        }
    }
    
    func printBoardToConsole() {
        print("..................................................")
        print("  0     1     2     3     4     5     6     7  /")
        for i in 0..<board.columns {
            print("-------------------------------------------------")
            for j in 0..<board.rows {
                print(board[i,j], terminator: "|")
            }
            print(i)
        }
        print("-------------------------------------------------")
    }
}
