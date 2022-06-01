//
//  ViewController.swift
//  DiceApp
//
//  Created by Kalybay Zhalgasbay on 03.04.2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Creating outlets for each object
    @IBOutlet weak var firstDice: UIImageView!
    
    @IBOutlet weak var secondDice: UIImageView!
    
    @IBOutlet weak var wallPaperImage: UIImageView!
    
    @IBOutlet weak var rollLButton: UIButton!
    
    @IBOutlet weak var attemptsLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    var diceArray: [String] = ["dice-1","dice-2","dice-3","dice-4","dice-5","dice-6"]
    var index = 0
    var attempts: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - Setting initial values of components
        wallPaperImage.image = UIImage(named: "wallPaper")
        wallPaperImage.layer.cornerRadius = 20
        firstDice.image = UIImage(named: diceArray[index])
        secondDice.image = UIImage(named: diceArray[index])
        
        
        rollLButton.setTitle("Roll", for: .normal)
        rollLButton.layer.cornerRadius = 10
        messageLabel.text = "Check your luck"
        attemptsLabel.text = "Attempts:"
        
        if(attempts == 0){
            messageLabel.text = "Check your luck"
        }
        
    }

    //MARK: - Creating and calling rollDice() function
    @IBAction func rollDice(_ sender: Any) {
        
        if(messageLabel.text == "You lost(" || messageLabel.text == "You WON, Congrats!"){
            messageLabel.text = "Check your luck"
        }
        callRollDice()
        
    }
    
    func callRollDice(){
        
        var result: [Int] = []
        index = Int.random(in: 0...5)
        firstDice.image = UIImage(named: diceArray[index])
        result.append(index)
        index = Int.random(in: 0...5)
        secondDice.image = UIImage(named: diceArray[index])
        result.append(index)
        
        if(attempts > 3){
            messageLabel.text = "You lost("
            attempts = 0
        }
        
        if(result[0]==result[1] && attempts<3){
            messageLabel.text = "You WON, Congrats!"
            attempts = 0
        }
        
        attemptsLabel.text = "Attempts: \(attempts)"
        attempts += 1
    }
}

