//
//  ViewController.swift
//  Three-Letter-Word
//
//  Created by Victoria Mahoney on 4/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    var letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var counter: Int = 0
    var currentLetter: String!
    
    @IBOutlet var wordLabels: [UILabel]!
    
    @IBOutlet weak var currentLetterLabel: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentLetter = letters[counter]
        currentLetterLabel.text = currentLetter
    }
 
    @IBAction func whenTapped2(_ sender: Any)
    {
        let selectedPoint = (sender as! AnyObject).location(in: stackView)
         print(selectedPoint)

        for label in wordLabels{
             if label.frame.contains(selectedPoint){
                 label.text = "\(currentLetter!)"
             }
         }
        
        counter += 1
        
        if counter == 26 {
            counter = resetCounter()
        }
        getAndSetCurrentletter()
        currentLetter = letters[counter]
        currentLetterLabel.text = currentLetter
    }
    
    func getAndSetCurrentletter()
    {
        currentLetter = letters[counter]
        currentLetterLabel.text = currentLetter
    }

    func resetCounter() -> Int
    {
        let alert = UIAlertController(title: "Resetting Counter", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            for label in self.wordLabels {
                label.text = "?"
            }
        }
        
        currentLetterLabel.text = "A"
        alert.addAction(okAction)
        present(alert, animated:true, completion:nil)
        return 0
    }

//when you do your rock paper scissors project under view there us a place called "tag" that is the index, so if you have an array you can change it to be the index of the array.
    
}





