//
//  LeaderboardViewController.swift
//  Project2
//
//  Created by Berta Devant on 11/23/15.
//  Copyright © 2015 Berta Devant. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    var scoreToDisplay = 0
    var usernameToDisplay = "anon"
    
    @IBOutlet weak var leaderboardsLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
            leaderboardsLabel.text = "\(usernameToDisplay) score is: \(scoreToDisplay)"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
