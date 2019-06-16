//
//  ViewController.swift
//  Othello
//
//  Created by Bartosz on 27/05/2019.
//  Copyright © 2019 Bartosz Bilski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var game = Othello()
        game.clear()
        game.setInitialBoard()
        game.printBoardToConsole()
        
    }
}

