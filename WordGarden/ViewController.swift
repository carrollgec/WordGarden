//
//  ViewController.swift
//  WordGarden
//
//  Created by Grace Carroll on 2/14/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var wordsGuessedLabel: UILabel!
    @IBOutlet weak var wordsRemainingLabel: UILabel!
    @IBOutlet weak var wordsMissedLabel: UILabel!
    @IBOutlet weak var wordsInGameLabel: UILabel!
    
    @IBOutlet weak var wordBeingRevealedLabel: UILabel!
    @IBOutlet weak var guessedLetterTextfield: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var gameStatusMessageLabel: UILabel!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    var wordsToGuess = ["SWIFT", "DOG", "CAT"]
    var currentWordIndex = 0
    var wordToGuess = ""
    var lettersGuessed = ""
    let maxNumWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var wordsGuessedCount = 0
    var wordsMissedCount = 0
    var guessCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = guessedLetterTextfield.text!
        guessLetterButton.isEnabled = !(text.isEmpty)
        wordToGuess = wordsToGuess[currentWordIndex]
        wordBeingRevealedLabel.text = "_" + String(repeating: " _", count: wordToGuess.count-1)
        updateGameStatusLabel()
    }
    
    func updateUIAfterGuess(){
        guessedLetterTextfield.resignFirstResponder()
        guessedLetterTextfield.text! = ""
        guessLetterButton.isEnabled = false
    }
    
    func formatRevealedWord(){
        var revealedWord = ""

        // loop through letters in wordToGuess
        for letter in wordToGuess{
            // check if letter in wordToGuess is in lettersGuessed (did you guess that letter)
            if lettersGuessed.contains(letter){
                //if yes, add this letter and a space to revealedWord
                revealedWord = revealedWord + "\(letter) "
            }else{
                revealedWord = revealedWord + "_ "
            }
        }
        // remove the extra space
        revealedWord.removeLast()
        wordBeingRevealedLabel.text = revealedWord
    }
    
    func updateAfterWinOrLose(){
        currentWordIndex += 1
        guessedLetterTextfield.isEnabled = false
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = false
       
        updateGameStatusLabel()
    }
    
    func updateGameStatusLabel(){
        wordsGuessedLabel.text = "Words Guessed: \(wordsGuessedCount)"
        wordsMissedLabel.text = "Words Missed: \(wordsMissedCount)"
        wordsRemainingLabel.text = "Words to Guess: \(wordsToGuess.count - (wordsGuessedCount + wordsMissedCount))"
        wordsInGameLabel.text = "Words in Game: \(wordsToGuess.count)"
    }
    
    func guessALetter(){
        let currentLetterGuessed = guessedLetterTextfield.text!
        lettersGuessed = lettersGuessed + currentLetterGuessed
        formatRevealedWord()
        
        //update image if needed, and keep track of wrong guesses
        if wordToGuess.contains(currentLetterGuessed) == false {
             wrongGuessesRemaining = wrongGuessesRemaining - 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        //update gameStatusMessageLabel
        guessCount += 1
        //this is the ternary operator, can be used in place of an if-statement
        let guesses = ( guessCount == 1 ? "Guess" : "Guesses")
        gameStatusMessageLabel.text = "You've made \(guessCount) \(guesses)"
        
        //After each guess, check for win or lose
        
        if wordBeingRevealedLabel.text!.contains("_") == false{
            gameStatusMessageLabel.text = "You've guessed it! It took you \(guessCount) guesses to guess the word."
            wordsGuessedCount += 1
            updateAfterWinOrLose()
        }else if wrongGuessesRemaining == 0{
            gameStatusMessageLabel.text = "So sorry. You're all out of guesses."
            wordsMissedCount += 1
            updateAfterWinOrLose()
        }
        if currentWordIndex == wordsToGuess.count {
            gameStatusMessageLabel.text! += "\n\nYou've tried all the words! Restart from the beginning?"
        }
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateUIAfterGuess()
    }
    
    @IBAction func guessedLetterButtonPressed(_ sender: UIButton) {
        guessALetter()
        updateUIAfterGuess()
    }
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        if currentWordIndex == wordToGuess.count {
            currentWordIndex = 0
            wordsGuessedCount = 0
            wordsMissedCount = 0
            
        }
        
        playAgainButton.isHidden = true
        guessedLetterTextfield.isEnabled = true
        guessLetterButton.isEnabled = false
        wordToGuess = wordsToGuess[currentWordIndex]
        wrongGuessesRemaining = maxNumWrongGuesses
        wordBeingRevealedLabel.text = "_" + String(repeating: " _", count: wordToGuess.count-1)
        guessCount = 0
        flowerImageView.image = UIImage(named: "flower\(maxNumWrongGuesses)")
        lettersGuessed = ""
        updateGameStatusLabel()
        gameStatusMessageLabel.text = "You've Made Zero Guesses"
    }
     
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        sender.text = String(sender.text?.last ?? " ").trimmingCharacters(in: .whitespaces)
        guessLetterButton.isEnabled = !(sender.text!.isEmpty)
         
    }
    
}

