//
//  ViewController.swift
//  zar atma oyunu
//
//  Created by Ali Erdem Kökcik on 29.06.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblPlayer1Score: UILabel!
    @IBOutlet weak var lblPlayer2Score: UILabel!
    
    @IBOutlet weak var lblPlayer1Point: UILabel!
    @IBOutlet weak var lblPlayer2Point: UILabel!
    
    @IBOutlet weak var imgPlayer1State: UIImageView!
    @IBOutlet weak var imgPlayer2State: UIImageView!
    
    @IBOutlet weak var imgDice1: UIImageView!
    @IBOutlet weak var imgDice2: UIImageView!
    
    @IBOutlet weak var lblSetResult: UILabel!
    var playerPoint = (firstPlayerPoint : 0, secondPlayerPoint : 0)
    var playerScores = (firstPlayerScore : 0, secondPlayerScore : 0)
    var playerTurn : Int = 1
    
    var maxSet : Int = 5
    var currentSet : Int = 1
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //closure
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5){
            
        }
        
        
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "arkaPlan")!)
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if currentSet > maxSet {
            return
        }
        
        createDiceValues()
    }
    
    func setResult(dice1 : Int, dice2 : Int){
        if playerTurn == 1 {
            //new set begin
            playerPoint.firstPlayerPoint = dice1 + dice2
            lblPlayer1Point.text = String(playerPoint.firstPlayerPoint)
            imgPlayer1State.image = UIImage(named: "bekle")
            imgPlayer2State.image = UIImage(named: "onay")
            lblSetResult.text = "Player 2's turn"
            playerTurn = 2
            lblPlayer2Point.text = "0"
        } else {
            playerPoint.secondPlayerPoint = dice1 + dice2
            lblPlayer2Point.text = String(playerPoint.secondPlayerPoint)
            imgPlayer2State.image = UIImage(named: "bekle")
            imgPlayer1State.image = UIImage(named: "onay")
            playerTurn = 1
            //set will end
            if playerPoint.firstPlayerPoint > playerPoint.secondPlayerPoint {
                //1st player won
                playerScores.firstPlayerScore += 1
                lblSetResult.text = "First player won the \(currentSet). set"
                currentSet += 1
                lblPlayer1Score.text = String(playerScores.firstPlayerScore)
            } else if playerPoint.secondPlayerPoint > playerPoint.firstPlayerPoint {
                //2nd player won
                playerScores.secondPlayerScore += 1
                lblSetResult.text = "Second player won the \(currentSet). set"
                currentSet += 1
                lblPlayer2Score.text = String(playerScores.secondPlayerScore)
            } else {
                //draw
                //current set won't change
                lblSetResult.text = "\(currentSet). set is draw"
            }
            
        }
        
        
        
        
        
        
        
    }
    
    func createDiceValues(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            let dice1 = arc4random_uniform(6) + 1
            let dice2 = arc4random_uniform(6) + 1
            
            self.imgDice1.image = UIImage(named: String(dice1))
            self.imgDice2.image = UIImage(named: String(dice2))
            self.setResult(dice1: Int(dice1), dice2: Int(dice2))
            
            if self.currentSet > self.maxSet {
                if self.playerScores.firstPlayerScore > self.playerScores.secondPlayerScore{
                    self.lblSetResult.text = "First player won the game"
                } else {
                    self.lblSetResult.text = "Second player won the game"
                }
            }
        }
    
                                      }

                                    
}
