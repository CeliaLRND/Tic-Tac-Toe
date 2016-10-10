//
//  ViewController.swift
//  tictactoe
//
//  Created by MAC on 10/10/2016.
//  Copyright © 2016 MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLbl: UILabel!
    @IBOutlet weak var playAgainBtn: UIButton!
     @IBAction func playAgain(_ sender: AnyObject) {
        
        activePlayer = 1
        activeGame = true
        gameState = [0, 0, 0, 0, 0, 0, 0, 0 ,0]
        
        for i in 1..<10 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: [])
            }
        
            winnerLbl.isHidden = true
            playAgainBtn.isHidden = true
            self.winnerLbl.center = CGPoint(x: self.winnerLbl.center.x - 500, y:self.winnerLbl.center.y)
            self.playAgainBtn.center = CGPoint(x: self.playAgainBtn.center.x - 500, y: self.playAgainBtn.center.y)
        
        
    }
    // 1 is circle 2 is cross

    var activePlayer = 1
    var activeGame = true
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0 ,0] // 0-empty 1-circle 2-cross
    let winningCombination = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        if gameState[activePosition] == 0 && activeGame {
            gameState[activePosition] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "circle.png"), for: [])
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
            
            for combination in winningCombination {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    // we have a winner
                    activeGame = false
                    winnerLbl.isHidden = false
                    playAgainBtn.isHidden = false
                    if gameState[combination[0]] == 1 {
                        winnerLbl.text = "Circle has won!"
                    } else {
                        winnerLbl.text = "Cross has won!"
                    }
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLbl.center = CGPoint(x: self.winnerLbl.center.x + 500, y:self.winnerLbl.center.y)
                        self.playAgainBtn.center = CGPoint(x: self.playAgainBtn.center.x + 500, y: self.playAgainBtn.center.y)
                        
                        
                    })
                }
            }
            
            }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLbl.isHidden = true
        playAgainBtn.isHidden = true
        
        winnerLbl.center = CGPoint(x: winnerLbl.center.x - 500, y:winnerLbl.center.y)
        playAgainBtn.center = CGPoint(x: playAgainBtn.center.x - 500, y: playAgainBtn.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

