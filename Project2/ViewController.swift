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
    @IBOutlet weak var scoreLabel: UILabel!
    
    let countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "russia", "spain", "uk", "us", "nigeria", "poland"]
    var score = 0, correctAnswer = 0
    var userName : String?
    var textField: UITextField?
    var countriesLeft: [String] = []
    var countriestemp: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "russia", "spain", "uk", "us", "nigeria", "poland"]
        countriesLeft = countries
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        newGame()
        
    }
    func newGame()
    {
        let ac = UIAlertController(title: "What's your name?", message:nil, preferredStyle:  .Alert)
        ac.addAction(UIAlertAction(title:"Continue", style: .Default, handler:usernameTextField))
        ac.addTextFieldWithConfigurationHandler{(textField) -> Void in
            //textField.placeholder="Enter your name"
            //self.textField = textField
            self.textField = textField
            self.textField?.placeholder = "Enter your name here"
        }
        presentViewController(ac, animated:true, completion:nil)
        //        userName = textField?.text ?? "anon" USE THIS when specifying the the username for leaderboards if I do not use it before that
        askQuestion()
        
    }
    func usernameTextField(action: UIAlertAction! = nil)
    {
        if let text = textField?.text where text.characters.count > 0 {
            userName = text
        }else {
            userName = "anon"
        }
        scoreLabel.text = "\(userName!) your score is : \(score)"
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        countriestemp = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        let countryPick = countriesLeft.random
        if countryPick == nil
        {
            endGame()
            return
            
        } else {
            title = countryPick!.uppercaseString
        }

        let indexUsedTemp  = countriestemp.indexOf(countryPick!)
        countriestemp.removeAtIndex(indexUsedTemp!)
        while (countriestemp[0] == countryPick || countriestemp[1] == countryPick)
        {
            countriestemp = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
            
        }
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
            if (correctAnswer == 0)
            {
                button1.setImage(UIImage(named:countryPick!), forState: .Normal)
                button2.setImage(UIImage(named:countriestemp[0]), forState: .Normal)
                button3.setImage(UIImage(named:countries[1]), forState: .Normal)
            }else if (correctAnswer == 1){
                button1.setImage(UIImage(named:countriestemp[0]), forState: .Normal)
                button2.setImage(UIImage(named:countryPick!), forState: .Normal)
                button3.setImage(UIImage(named:countriestemp[1]), forState: .Normal)
            }else if (correctAnswer == 2){
                button1.setImage(UIImage(named:countriestemp[0]), forState: .Normal)
                button2.setImage(UIImage(named:countriestemp[1]), forState: .Normal)
                button3.setImage(UIImage(named:countryPick!), forState: .Normal)
            }
        //let indexUsed  = countriesLeft.indexOf(countryPick!)
        let indexUsed = countriesLeft.indexOf(countryPick!)
        countriesLeft.removeAtIndex(indexUsed!)
        
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
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title:"Continue", style: .Default, handler:askQuestion))
        presentViewController(ac, animated: true, completion: nil)
        scoreLabel.text = "\(userName!) your score is : \(score)"
        
    }
    
    func endGame()
    {
        setUpAlert("Your Final score is \(score)",buttonText: "Continue")
        
    }
    
    func setUpAlert(title:String, buttonText: String)
    {
    
        let ac = UIAlertController(title:title , message: nil, preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: buttonText, style: .Default, handler: { _ -> Void in self.performSegueWithIdentifier("LeaderBoardSegue", sender: self) }))
        presentViewController(ac, animated: true, completion: nil)

    }
    
    /*
    func randomNumber() -> Int {
        let randomNumber = Int(arc4random_uniform(12))
    
    while countriesUsed[randomNumber] == " "
    {
    randomNumber = Int(arc4random_uniform(12))
    }
    
    countriesUsed[randomNumber] = " "
    return randomNumber
    
    }

*/

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "LeaderBoardSegue"
        {
            if let destinationVC = segue.destinationViewController as? LeaderboardViewController {
                destinationVC.scoreToDisplay = score
                destinationVC.usernameToDisplay = userName ?? "anon"
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let x = String()
    
}

extension Array {
    
    var random: Element? {
        guard count > 0 else { return nil }
        return self[Int(arc4random()%UInt32(count))]
    }
}

