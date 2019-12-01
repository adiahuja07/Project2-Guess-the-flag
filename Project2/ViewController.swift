//
//  ViewController.swift
//  Project2
//
//  Created by appinventiv on 25/11/19.
//  Copyright © 2019 a. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionNo = 1

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 2
        button3.layer.borderWidth = 3
        
        button1.layer.borderColor = UIColor.gray.cgColor
        button2.layer.borderColor = UIColor.gray.cgColor
        button3.layer.borderColor = UIColor.gray.cgColor
        
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {

        var title : String
        questionNo += 1
        if sender.tag == correctAnswer {
            title = "CORRECT"
            score += 1
        }
        else {
            title = "INCORRECT That's the flag of \(countries[sender.tag].uppercased())"
        }
        
        var ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        if questionNo == 10 {
            ac = UIAlertController(title: "Final score", message: "Your score is \(score)", preferredStyle: .alert)
            present(ac, animated: true, completion: nil)

        }
        else {
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: askQuestion))
            
            present(ac, animated: true, completion: nil)
        }
       
    }

    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased() + ", Score: \(score)"
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    func flagTapped(country : String) {
        if country == countries[correctAnswer] {
            print("correct")
        }
        else {
            print("Wrong")
        }
    }
}

