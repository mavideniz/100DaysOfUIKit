//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Doğancan Mavideniz on 30.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var askedQuestion = 0
    
    override func viewDidLoad() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 2
        button3.layer.borderWidth = 3
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion(action: nil)
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = ("\(countries[correctAnswer].uppercased()) - Your score \(score)")
    }
    func chekQuestion(title: String) {
            if askedQuestion == 10 {
                let ac = UIAlertController(title: title, message: "That was the last question. Your score is \(score)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: restartGame))
                present(ac, animated: true)
                askQuestion()
            } else {
                let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                present(ac, animated: true)
            }
        }
    func restartGame(action: UIAlertAction! = nil) {
         askedQuestion = 0
         score = 0
     }
        
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        askedQuestion += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            chekQuestion(title: title)
        } else {
            title = "Wrong! That’s the flag of \(countries[sender.tag].uppercased())"
            score -= 1
            chekQuestion(title: title)
        }
        
    }
    @objc func shareTapped() {
        let vc = UIActivityViewController(activityItems: ["Hey! My score is \(score). Do you want try?"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    

}

