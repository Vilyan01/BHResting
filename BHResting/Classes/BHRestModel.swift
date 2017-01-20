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
        case IES, ES, S, AE, VES, I, A, ICES, IS_ES
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
                                          "turf":"turfs",
                                          "ego":"egos",
                                          "folio":"folios",
                                          "halo":"halos",
                                          "inferno":"infernos",
                                          "lasso":"lassos",
                                          "memento":"mementos",
                                          "memo":"memos",
                                          "piano":"pianos",
                                          "photo":"photos",
                                          "portfolio":"portfolios",
                                          "pro":"pros",
                                          "silo":"silos",
                                          "solo":"solos",
                                          "stereo":"stereos",
                                          "studio":"studios",
                                          "taco":"tacos",
                                          "tattoo":"tattoos",
                                          "tuxedo":"tuxedos",
                                          "typo":"typos",
                                          "veto":"vetoes",
                                          "video":"videos",
                                          "yo":"yos",
                                          "zoo":"zoos",
                                          "abacus":"abacuses",
                                          "crocus":"crocuses",
                                          "genus":"genera",
                                          "octopus":"octopuses",
                                          "rhombus":"rhombuses",
                                          "walrus":"walruses",
                                          "album":"albums",
                                          "stadium":"stadiums",
                                          "agenda":"agendas",
                                          "alfalfa":"alfalfas",
                                          "aurora":"auroras",
                                          "banana":"bananas",
                                          "barracuda":"barracudas",
                                          "cornea":"corneas",
                                          "nova":"novas",
                                          "phobia":"phobias",
                                          "balloon":"balloons",
                                          "carton":"cartons",
                                          "annex":"annexes",
                                          "complex":"complexes",
                                          "duplex":"duplexes",
                                          "hex":"hexes",
                                          "index":"indexes",
                                          "child":"children",
                                          "die":"dice",
                                          "foot":"feet",
                                          "goose":"geese",
                                          "louse":"lice",
                                          "man":"men",
                                          "mouse":"mice",
                                          "person":"people",
                                          "that":"those",
                                          "this":"these",
                                          "tooth":"teeth",
                                          "woman":"women"
                                        ]
        // check if the word is in the exception
        if let exception = exceptions[self] {
            return exception
        }
        
        var base = "", suffix = ""
        
        let truncated = self.substring(to: self.index(before: self.endIndex))
        let secondTruncated = truncated.substring(to: truncated.index(before: truncated.endIndex))
        
        switch self.determineSuffix() {
        case .A:
            base = secondTruncated
            suffix = "a"
            break
        case .AE:
            base = truncated
            suffix = "ae"
            break
        case .ES:
            base = self
            suffix = "es"
            break
        case .I:
            base = secondTruncated
            suffix = "i"
            break
        case .ICES:
            base = secondTruncated
            suffix = "ices"
            break
        case .IES:
            base = truncated
            suffix = "ies"
            break
        case .IS_ES:
            base = secondTruncated
            suffix = "es"
            break
        case .S:
            base = self
            suffix = "s"
            break
        case .VES:
            base = secondTruncated
            suffix = "ves"
            break
        }
        
        // Return self to test the exception for now
        return base + suffix
    }
    
    private func determineSuffix() -> StringSuffix {
        // All rules come from http://www.enchantedlearning.com/grammar/partsofspeech/nouns/plurals/
        let vowels = ["a", "e", "i", "o", "u"]
        let consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "x", "y", "z"]
        
        let truncated = self.substring(to: self.index(before: self.endIndex))
        let secondTruncated = truncated.substring(to: truncated.index(before: truncated.endIndex))
        let lastChar = self.substring(from: self.index(before: self.endIndex))
        let secondToLastChar = truncated.substring(from: truncated.index(before: truncated.endIndex))
        let thirdToLastChar = secondTruncated.substring(from: secondTruncated.index(before: secondTruncated.endIndex))
        
        // if word ends with s, x, ch, or sh: es
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
        else if lastChar == "e" && (secondToLastChar == "f" && thirdToLastChar != "f") {
            return .VES
        }
            
        else if lastChar == "o" {
            return .ES
        }
            
        else if lastChar == "s" && secondToLastChar == "i" {
            return .IS_ES
        }
        
        else if lastChar == "u" && secondToLastChar == "s" {
            return .I
        }
        
        else if lastChar == "a" && secondToLastChar != "i" {
            return .AE
        }
        
        else if lastChar == "o" && secondToLastChar == "n" {
            return .A
        }
        
        else if lastChar == "x" && secondToLastChar == "e" {
            return .ICES
        }
        
        else {
            return .S
        }
    }
}
