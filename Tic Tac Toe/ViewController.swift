//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Nima Farahani on 7/24/16.
//  Copyright © 2016 Nima Farahani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func shouldAutorotate() -> Bool {
        return false
    }

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var winner: UILabel!

    var activePlayer = 1
    var gameActive = true
    var gameState = [0,0,0,0,0,0,0,0,0]
    var win = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBAction func buttonPressed(sender: AnyObject) {
        if gameState[sender.tag] == 0 && gameActive == true{
            var image = UIImage()
            
            //change state of the pressed buttons
            gameState[sender.tag] = activePlayer
            if activePlayer == 1{
                image = UIImage(named:("O.png"))!
                activePlayer = 2

            }else{
                image = UIImage(named:("X.png"))!
                activePlayer = 1

            }
            
            // here we use sender.setImage instead of button.setImage
            //because we want whichever button pressed, the same
            //button changes to other photo
            sender.setImage(image, forState: .Normal)
            
            //shows the tag for each button
            //print(sender.tag)
            //loop i the array win and check if their states are the same to pick the winner
            for set in win{
                if gameState[set[0]] != 0 && gameState[set[0]] == gameState[set[1]] && gameState[set[1]] == gameState[set[2]]{
                    if activePlayer == 1{
                        winner.text = "The winner is X"
                        
                    }else{
                        winner.text = "The winner is O"
                    }
                    
                    // set the animation for blinking text
                    UIView.animateWithDuration(0.5, delay: 1.0, options: [.CurveEaseInOut, .Autoreverse, .Repeat], animations: {
                        
                        self.winner.alpha = 0.0
                        
                        }, completion: nil)
                    
                    gameActive = false
                }
            }
        }
    }
    
    // to make the button look round or oval add line layer.cornerRadius and make the corresponding 
    // number more than 1, in Identity inpector section
    
    
    @IBAction func reset(sender: AnyObject) {
        activePlayer = 1
        gameActive = true
        gameState = [0,0,0,0,0,0,0,0,0]
        var buttonReset : UIButton
        for i in 0  ..< 9  {
            buttonReset = view.viewWithTag(i) as! UIButton
            buttonReset.setImage(nil, forState: .Normal)
        }
        winner.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

