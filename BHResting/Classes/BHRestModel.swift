//
//  BHRestModel.swift
//  Pods
//
//  Created by Brian Heller on 1/14/17.
//
//

import Foundation

open class BHRestModel {
    internal var path:String?
    public init() {
        self.path = String(describing: type(of: self)).lowercased().pluralize()
    }
    
    public func save() -> Bool {
        return true
    }
}

// MARK: String Pluralization

extension String {
    enum StringSuffix {
        case IES, ES, S, AE, VES, I, A, ICES
    }
    
    public func pluralize() -> String {
        let exceptions:[String:String] = ["ox":"oxen",
                                          "axis":"axes",
                                          "belief":"beliefs",
                                          "chef":"chefs",
                                          "chief":"chiefs",
                                          "dwarf":"dwarfs",
                                          "grief":"greifs",
                                          "gulf":"gulfs",
                                          "handkerchief":"handkerchiefs",
                                          "kerchief":"kerchiefs",
                                          "mischief":"mischiefs",
                                          "muff":"muffs",
                                          "oaf":"oafs",
                                          "proof":"proofs",
                                          "roof":"roofs",
                                          "safe":"safes",
                                          "turf":"turfs"
                                        ]
        // check if the word is in the exception
        if let exception = exceptions[self] {
            return exception
        }
        
        // Return self to test the exception for now
        return self
    }
    
    private func determineSuffix() -> StringSuffix {
        // All rules come from http://www.enchantedlearning.com/grammar/partsofspeech/nouns/plurals/
        let vowels = ["a", "e", "i", "o", "u"]
        let consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "x", "y", "z"]
        
        let truncated = self.substring(to: self.index(before: self.endIndex))
        let lastChar = self.substring(from: self.index(before: self.endIndex))
        let secondToLastChar = truncated.substring(from: truncated.index(before: truncated.endIndex))
        
        // if word ends with s, x, ch, or sh: es
        // EXCEPTIONS: axis, ox
        if lastChar == "s" || lastChar == "x" || (lastChar == "h" && (secondToLastChar == "c" || secondToLastChar == "s")) {
            return .ES
        }
        
        // word ends in z: es
        else if lastChar == "z" {
            return .ES
        }
        
        // word ends in y preceded by vowel: s
        else if lastChar == "y" && vowels.contains(secondToLastChar) {
            return .S
        }
        
        // word ends in y preceded by consonant: ies
        else if lastChar == "y" && consonants.contains(secondToLastChar) {
            return .IES
        }
        
        // Ends with 'f' or 'fe' (but not 'ff' or 'ffe'): Change the 'f' or 'fe' to 'ves'
        /*
        Exceptions:
         belief/beliefs, chef/chefs, chief/chiefs, dwarf/dwarfs, grief/griefs, gulf/gulfs, handkerchief/handkerchiefs, kerchief/kerchiefs, mischief/mischiefs, muff/muffs, oaf/oafs, proof/proofs, roof/roofs, safe/safes, turf/turfs
        */
        
        
        return .S
        
    }
}
