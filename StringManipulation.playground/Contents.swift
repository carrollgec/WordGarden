import UIKit

var myName = "Gallaugher"
var smallerString = "laugh"

//contains
if myName.contains(smallerString){
    print("\(myName) contains \(smallerString)")
} else{
    print("\(myName) does not contain \(smallerString)")
}

// hasPrefix and hasSuffix

var occupation = "Swift Developer"
var searchString = "Swift"

print("\nPREFIX SEARCH")

if occupation.hasPrefix(searchString){
    print("You're Hired!")
}else{
    print("No job for you!")
}

print("\nSUFFIX SEARCH")
occupation = "iOS Developer"
searchString = "Developer"

if occupation.hasSuffix(searchString) {
    print("You're Hired! We need more \(occupation)s")
}else{
    print("No job for you! We don't need any \(occupation)s")
}
 
// .removeLast()
// cannot call on a constant, will modify original and return removed character

print("\nREMOVE")

var bandName = "The White Stripes"
let lastChar = bandName.removeLast()
print("After we remove \(lastChar) the band is just \(bandName)")

// .removeFirst(k: Int )
print("\nREMOVE FIRST #")
var person = "Dr. Nick"
let title = "Dr. "
person.removeFirst(title.count)
print(person)

// .replacingOccurances(of: with:), returns new string
print("\nREPLACING OCCURANCES OF")

// 123 James St
// 123 James St.
// 123 James Street

var address = "123 James St."
var streetString = "St."
var replacementString = "Street"
 
var standardAddress = address.replacingOccurrences(of: streetString, with: replacementString)
print(standardAddress)

// Iterate through a string
print("\nSTRING ITERATION")

var name = "Gallaugher"
var backwardsName = ""
for letter in name{
    backwardsName = String(letter) + backwardsName
}
print("\(name), \(backwardsName)")

//capitalization
print("\nPLAYING W CAPS")

var crazyCaps = "SwIFt DeVEloPEr"
var upperCased = crazyCaps.uppercased()
var lowerCased = crazyCaps.lowercased()
var capitalized = crazyCaps.capitalized
print(crazyCaps, upperCased, lowerCased, capitalized)

// Word Garden Challenge

var wordToGuess = "SWIFT"
var revealedWord = "_"

for _ in 1...wordToGuess.count-1{
    revealedWord = revealedWord + " _"
}
//revealedWord.removeLast()
print("\(wordToGuess) will show up as '\(revealedWord)'")

// Create a String from repeating value
revealedWord = "_" + String(repeating: " _", count: wordToGuess.count-1)
print("Using repeating String: \(revealedWord)")

//REVEAL THE WORD
print("\nREVEAL THE WORD")
wordToGuess = "STARWARS"
var lettersGuessed = "SQFTXW"
revealedWord = ""

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
print("wordToGuess: \(wordToGuess)")
print("lettersGuessed: \(lettersGuessed)")
print("revealedWord: \(revealedWord)")
