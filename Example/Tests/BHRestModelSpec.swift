//
//  BHRestModelSpec.swift
//  BHResting
//
//  Created by Brian Heller on 1/14/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import BHResting

class Book : BHRestModel {
    
}

class Property: BHRestModel {
    
}

class Box: BHRestModel {
    
}

class Ox: BHRestModel {
    
}

class BHRestModelSpec: QuickSpec {
    override func spec() {
        describe("Creating a model") { 
            it("has a path that is a plural, lower cased form of its class name") {
                let book = Book()
                expect(book.path) == "books"
                
                let property = Property()
                expect(property.path) == "properties"
                
                let box = Box()
                expect(box.path) == "boxes"
                
                let ox = Ox()
                expect(ox.path) == "oxen"
            }
        }
        
        describe("Saving a model") {
            
        }
        
        describe("Getting a model") {
        }
        
        describe("Getting all models") {
        }
        
        describe("Deleting a model") {
        }
        
        describe("Updating a model") {
        }
    }
}
