//
//  GameScene.swift
//  Othello
//
//  Created by Bartosz on 16/06/2019.
//  Copyright © 2019 Bartosz Bilski. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var gameboardNode: SKSpriteNode!
    var infoLabel: SKLabelNode!
    var gamePieceNodes = [SKNode]()
    
    // MARK: Scene Loading
    override func didMove(to view: SKView) {
        
        super.didMove(to: view)
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        // background
        let backgroundNode = SKSpriteNode(imageNamed: "back")
        backgroundNode.scale(to: view.frame.size)
        addChild(backgroundNode)
        
        // gameboard
        let boardSizeWidth = view.frame.width - 10
        
        gameboardNode = SKSpriteNode(texture: SKTexture(imageNamed: "board2"),
                                     size: CGSize(width: boardSizeWidth, height: boardSizeWidth))
        addChild(gameboardNode)
        
        // header
        
        // infoLabel
        infoLabel = SKLabelNode(fontNamed: "Chalkduster")
        //infoLabel = SKLabelNode(fontNamed: UIFont.boldSystemFont(ofSize: 40).fontName)
        infoLabel.fontColor = .white
        infoLabel.fontSize = 50
        infoLabel.verticalAlignmentMode = .center
        infoLabel.position.y = (view.frame.height / 2) - 40
        addChild(infoLabel)
        infoLabel.text = "Othello v.1"
    }
    
}
