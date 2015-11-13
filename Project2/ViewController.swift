//
//  ViewController.swift
//  Project2
//
//  Created by Berta Devant on 11/13/15.
//  Copyright © 2015 Berta Devant. All rights reserved.
//
import GameplayKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String] ()//when you add () it creates the actual string
    var score = 0, correctAnswer = 0
    
    //var countriesUsed: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "russia", "spain", "uk", "us", "nigeria", "poland"]
        //countriesUsed = countries
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        askQuestion()
        
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        title = countries[correctAnswer].uppercaseString
        button1.setImage(UIImage(named:countries[0]), forState: .Normal)
        button2.setImage(UIImage(named:countries[1]), forState: .Normal)
        button3.setImage(UIImage(named:countries[2]), forState: .Normal)
        //countriesUsed = countries
    }
    @IBAction func buttonTapped(sender: UIButton) {
        var title:String
        if sender.tag == correctAnswer {
            title = "Correct"
            ++score
        } else {
            title = "Wrong"
            --score
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title:"Continue", style: .Default, handler:askQuestion))
        presentViewController(ac, animated: true, completion: nil)
        
        
    }
    /*
    func randomNumber() -> Int {
        var randomNumber = Int(arc4random_uniform(12))
        
        while countriesUsed[randomNumber] == " "
        {
            randomNumber = Int(arc4random_uniform(12))
        }
        
        countriesUsed[randomNumber] = " "
        return randomNumber
    } 
*/
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let x = String()
    
}

