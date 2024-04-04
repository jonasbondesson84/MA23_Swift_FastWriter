//
//  Word.swift
//  FastWriter
//
//  Created by Jonas Bondesson on 2024-03-28.
//

import Foundation

struct structWord {
    var word: String
    var difficulty: Int
}

class Word {
    var words = [structWord]()
    
    init() {
        words.append(structWord(word: "Hej", difficulty: 1))
        words.append(structWord(word: "Bil", difficulty: 1))
        words.append(structWord(word: "Hus", difficulty: 1))
        words.append(structWord(word: "Sol", difficulty: 1))
        words.append(structWord(word: "Hund", difficulty: 1))
        words.append(structWord(word: "Träd", difficulty: 1))
        words.append(structWord(word: "Mat", difficulty: 1))
        words.append(structWord(word: "Vatten", difficulty: 1))
        words.append(structWord(word: "Cykel", difficulty: 2))
        words.append(structWord(word: "Bok", difficulty: 1))
        words.append(structWord(word: "Traktor", difficulty: 2))
        words.append(structWord(word: "Stol", difficulty: 2))
        words.append(structWord(word: "Äpple", difficulty: 2))
        words.append(structWord(word: "Banan", difficulty: 2))
        words.append(structWord(word: "Skola", difficulty: 2))
        words.append(structWord(word: "Buss", difficulty: 2))
        words.append(structWord(word: "Dator", difficulty: 2))
        words.append(structWord(word: "Fågel", difficulty: 2))
        words.append(structWord(word: "Stad", difficulty: 2))
        words.append(structWord(word: "Park", difficulty: 2))
        words.append(structWord(word: "Klocka", difficulty: 2))
        words.append(structWord(word: "Förbannad", difficulty: 3))
        words.append(structWord(word: "Skadeståndsanspråk", difficulty: 3))
        words.append(structWord(word: "Övermäktig", difficulty: 3))
        words.append(structWord(word: "Komplicerad", difficulty: 3))
        words.append(structWord(word: "Försoning", difficulty: 3))
        words.append(structWord(word: "Jämförelsevis", difficulty: 3))
        words.append(structWord(word: "Motstridig", difficulty: 3))
        words.append(structWord(word: "Upplösning", difficulty: 3))
        words.append(structWord(word: "Oförutsägbar", difficulty: 3))
        words.append(structWord(word: "Undertrycka", difficulty: 3))
    
    }
    
    func getRandomWord() -> structWord? {
        if !words.isEmpty {
            return words.randomElement()
        } else {
            return nil
        }
    }
    
    func compareWords(currentWord: String?, answerWord: String?) -> Bool {
        return answerWord == currentWord
    }
    
}
