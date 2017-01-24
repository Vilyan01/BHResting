//
//  BHRestModelSpec.swift
//  BHResting
//
//  Created by Brian Heller on 1/14/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import BHResting

class Book : BHRestModel {
    private var id:Int?
    private var title:String?
    private var author:String?
    
    init(title:String?, author:String?) {
        self.title = title
        self.author = author
        self.id = 1
        
        super.init()
    }
}

class Property: BHRestModel {
    
}

class Box: BHRestModel {
    
}

class Ox: BHRestModel {
    
}

class Knife: BHRestModel {
    
}

class BHRestModelSpec: QuickSpec {
    override func spec() {
        let book = Book(title: "A Series of Unfortunate Events", author: "Daniel Handler")
        describe("Creating a model") { 
            it("has a path that is a plural, lower cased form of its class name") {
                expect(book.path) == "books"
                
                let property = Property()
                expect(property.path) == "properties"
                
                let box = Box()
                expect(box.path) == "boxes"
                
                let ox = Ox()
                expect(ox.path) == "oxen"
                
                let knife = Knife()
                expect(knife.path) == "knives"
            }
        }
        
        describe("Converting a model to json") {
            it("Converts user defined attributes to a model") {
                let dict = ["book": ["id": 1, "title":"A Series of Unfortunate Events", "author":"Daniel Handler"]]
                do {
                    let data = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                    let json = book.toJSON()
                    expect(json!) == data
                }
                catch let error {
                    print(error)
                }
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
