//
//  BHRestManagerSpec.swift
//  BHResting
//
//  Created by Brian Heller on 1/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import BHResting

class BHRestManagerSpec: QuickSpec {
    override func spec() {
        describe("When setting the base URI") { 
            it("retrieves the base URI") {
                BHRestManager.shared().setBaseUri(uri: "http://localhost:3000/")
                expect(BHRestManager.shared().baseUri()) == "http://localhost:3000/"
            }
        }
        
        describe("After adding additional path components") { 
            it("has those path components in the full Uri") {
                BHRestManager.shared().setAdditionalPathComponents(components: ["api","v1"])
                expect(BHRestManager.shared().fullUri()) == "http://localhost:3000/api/v1/"
            }
        }
        
        describe("When adding additional headers") { 
            it("saves the additional headers to a variable") {
                BHRestManager.shared().addAdditionalHeader(header: ["Accept":"application/json"])
                expect(BHRestManager.shared().additionalHeaders()!.count) == 1
            }
        }
    }
}
