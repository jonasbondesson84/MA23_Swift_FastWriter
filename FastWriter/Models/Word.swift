//
//  Word.swift
//  FastWriter
//
//  Created by Jonas Bondesson on 2024-03-28.
//

import Foundation

struct structWord {
    var word: String
}

class Word {
    var words = [structWord]()
    
    init() {
        words.append(structWord(word: "Hej"))
        words.append(structWord(word: "Bil"))
        words.append(structWord(word: "Hus"))
        words.append(structWord(word: "Sol"))
        words.append(structWord(word: "Hund"))
        words.append(structWord(word: "Träd"))
        words.append(structWord(word: "Mat"))
        words.append(structWord(word: "Vatten"))
        words.append(structWord(word: "Cykel"))
        words.append(structWord(word: "Bok"))
        words.append(structWord(word: "Traktor"))
    }
    
    func getRandomWord() -> structWord? {
        if !words.isEmpty {
            return words.randomElement()
        } else {
            return nil
        }
    }
}


