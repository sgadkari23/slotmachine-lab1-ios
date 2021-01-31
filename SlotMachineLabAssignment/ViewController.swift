//
//  ViewController.swift
//  SlotMachineLabAssignment
//
//  Created by Supriya G on 1/30/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var blanks:Int = 0
    var grapes:Int = 0
    var bananas:Int = 0
    var oranges:Int = 0
    var cherries:Int = 0
    var bars:Int = 0
    var bells:Int = 0
    var sevens:Int = 0
    var playerBet :Int = 0
    var winnings:Int = 0
    var jackpot:Int = 0
    var playerMoney:Int = 0
    
    @IBAction func spinButton(_ sender: Any) {
        resetAll()
        print("Started")
        print(spinReels())
        print("Started")
        determineWinnings()
        print("Spin Ended")
    }
    
    
    private func spinReels() ->[String] {
               var betLine = [" ", " ", " "];
               var outCome = [0, 0, 0];

        for spin in 0...2
        {
            // (var spin = 0; spin < 3; spin++) {
            outCome[spin] = Int((Int.random(in: 0..<6) * 65)+1)
        
                   switch outCome[spin] {
                   case 1..<27: betLine[spin] = "Blank" // 41.5% probability
                                blanks+=1
                                break
                   case 28..<37 : betLine[spin] = "Grapes" // 15.4% probability
                               grapes+=1
                               break
                   case 38..<46 : betLine[spin] = "Banana" // 13.8% probability
                           bananas+=1
                           break
                   case 47..<54:  betLine[spin] = "Orange" // 12.3% probability
                           oranges+=1
                           break
                   case 55..<59: betLine[spin] = "Cherry" //  7.7% probability
                           cherries+=1
                           break
                   case 60..<62: betLine[spin] = "Bar"  //  4.6% probability
                           bars+=1
                           break
                   case 63..<64: betLine[spin] = "Bell" //  3.1% probability
                           bells+=1
                           break
                   case 65..<65: betLine[spin] = "Seven" //  1.5% probability
                           sevens+=1
                           break
                   default:
                    print("Jackpot!")
                   }
               }
               return betLine;
           }
        
    private func resetAll() {
               playerMoney = 1000;
               winnings = 0;
               jackpot = 5000;
               playerBet = 0;
    }
    
    /* This function calculates the player's winnings, if any */
    private func determineWinnings(){
        if (blanks == 0) {
            if (grapes == 3) {
                winnings = playerBet * 10
            }
            else if (bananas == 3) {
               winnings = playerBet * 20
            }
            else if (oranges == 3) {
                winnings = playerBet * 30
            }
            else if (cherries == 3) {
                winnings = playerBet * 40
            }
            else if (bars == 3) {
                winnings = playerBet * 50
            }
            else if (bells == 3) {
                winnings = playerBet * 75
            }
            else if (sevens == 3) {
                winnings = playerBet * 100
            }
            else if (grapes == 2) {
                winnings = playerBet * 2
            }
            else if (bananas == 2) {
                winnings = playerBet * 2
            }
            else if (oranges == 2) {
                winnings = playerBet * 3
            }
            else if (cherries == 2) {
                winnings = playerBet * 4
            }
            else if (bars == 2) {
                winnings = playerBet * 5
            }
            else if (bells == 2) {
                winnings = playerBet * 10
            }
            else if (sevens == 2) {
                winnings = playerBet * 20
            }
            else if (sevens == 1) {
                winnings = playerBet * 5
            }
            else {
                winnings = playerBet * 1
            }
            print("Win!")
        }
        else {
            print("Loss!");
        }

        print(winnings)
        playerMoney += winnings
        print(playerMoney)
        resetFruitTally()

    }
    
    private func resetFruitTally(){
              grapes = 0;
              bananas = 0;
              oranges = 0;
              cherries = 0;
              bars = 0;
              bells = 0;
              sevens = 0;
              blanks = 0;
          }


}

