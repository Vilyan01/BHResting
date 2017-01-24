//
//  BHURLBuilderSpec.swift
//  BHResting
//
//  Created by Brian Heller on 1/24/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

@testable import BHResting
import Quick
import Nimble

class BHURLBuilderSpec: QuickSpec {
    override func spec() {
        describe("URL Builder static class") {
            let book = Book(title: "A Series of Unfortunate Events", author: "Daniel Handler")

            it("builds url for all items (index, create)") {
                let expectedUrl = URL(string: "http://localhost:3000/books")
                let actual = BHURLBuilder.indexUrlForObject(model: book)
                expect(actual) == expectedUrl

            }
            
            it("builds url for specific items (show, update, delete)") {
                let expectedUrl = URL(string: "http://localhost:3000/books/1")
                expect(BHURLBuilder.urlForObject(model: book, withIndex: 1)) == expectedUrl
            }
        }
    }
}
