// https://github.com/Quick/Quick

import Quick
import Nimble
import BHResting

class BHRestingSpec: QuickSpec {
    override func spec() {
        describe("BHRestManager") {
            it("Can set the base URL of the shared manager.") {
                BHRestManager.shared().setBaseUri(uri: "http://www.localhost:3000/")
                expect(BHRestManager.shared().baseUri()) == "http://www.localhost:3000/"
            }
            
            it("Can set additional path components to the URI") {
                BHRestManager.shared().setAdditionalPathComponents(components: ["api","v1"])
                expect(BHRestManager.shared().fullUri()) == "http://www.localhost:3000/api/v1/"
            }
            
            it("Can set additional headers") {
                BHRestManager.shared().addAdditionalHeader(header: ["Content-Type":"application/json"])
                expect(BHRestManager.shared().additionalHeaders()?.count) == 1
            }
        }
    }
}
