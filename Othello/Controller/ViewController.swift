//
//  ViewController.swift
//  Othello
//
//  Created by Bartosz on 27/05/2019.
//  Copyright © 2019 Bartosz Bilski. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    var board = Board()
    var strategist: Strategist!
    
    let scene = GameScene(size: UIScreen.main.bounds.size)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as? SKView {
            //let scene = GameScene(size: UIScreen.main.bounds.size)
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
        }
        
        setInitialBoard()
        printBoardGraphicToConsole()
        //updateViewFromModel()
    }
    
    // MARK: Initial Set-up
    func setInitialBoard() {
        board[3,3] = .white
        board[4,4] = .white
        board[3,4] = .black
        board[4,3] = .black
    }
    
    
    
    
    
//    func updateViewFromModel() {
//        let blackPieceNode = SKSpriteNode(imageNamed: "black")
//        let whitePieceNode = SKSpriteNode(imageNamed: "white")
//        for i in 0..<board.rows {
//            for j in 0..<board.columns {
//                if board[i,j] == .black {
//                    scene.addChild(blackPieceNode)
//                    scene.gamePieceNodes.append(blackPieceNode)
//                } else if board[i,j] == .white {
//                    scene.addChild(whitePieceNode)
//                    scene.gamePieceNodes.append(whitePieceNode)
//                }
//            }
//        }
//    }
    
    // MARK: Helper methods
    func printBoardGraphicToConsole() {
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
    
    // MARK: Other properties
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

