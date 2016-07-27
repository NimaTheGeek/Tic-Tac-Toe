//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Nima Farahani on 7/24/16.
//  Copyright © 2016 Nima Farahani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var winner: UITextView!
    
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
                    gameActive = false
                }
            }
        }
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

