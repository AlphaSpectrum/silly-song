//
//  ViewController.swift
//  Silly Song
//
//  Created by Alan Campos on 4/8/17.
//  Copyright © 2017 Alan Campos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fieldName: UITextField!
    @IBOutlet weak var lyricsView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        fieldName.delegate = self
        lyricsView.layer.cornerRadius = 5.0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reset(_ sender: Any) {
        fieldName.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, firstName: fieldName.text!)
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

// Start custom functions *****

    // Lyrics Template
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

    // If the first letter of the name is a consonant, then remove it
func shortNameFor(name: String) -> String {
    
    var lowercaseName = name.lowercased()
    var startsWithVowel = false
    let vowelSet: [Character] = ["a","e","i","o","u"]
    let firstLetter = lowercaseName.characters[lowercaseName.characters.startIndex]
    
    for vowel in vowelSet {
        if firstLetter == vowel {
            startsWithVowel = true
            break
        }
    }
    
    if !startsWithVowel {
        lowercaseName.remove(at: lowercaseName.startIndex)
    }
    
    return lowercaseName
}

    // Display customzied lyrics
func lyricsForName(lyricsTemplate: String, firstName: String) -> String {
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: firstName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFor(name: firstName))
    
    return lyrics
}
// End custom functions *****

