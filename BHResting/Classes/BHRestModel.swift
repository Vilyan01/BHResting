//
//  BHRestModel.swift
//  Pods
//
//  Created by Brian Heller on 1/14/17.
//
//

import Foundation
import EVReflection

public typealias ArrayCompletion = (_ results:[Any]?, _ error:Error?) -> Void

open class BHRestModel : EVObject {
    internal var path:String?

    public required init() {
        self.path = String(describing: type(of: self)).lowercased().pluralize()
    }
    public convenience init(data: Data) {
        let keyPath = String(describing: type(of: self)).lowercased()
        self.init(data: data, conversionOptions: .PropertyMapping, forKeyPath: keyPath)
        self.path = keyPath.pluralize()
    }
    public convenience init(fromDictionary: NSDictionary) {
        self.init(dictionary: fromDictionary)
        self.path = String(describing: type(of: self)).lowercased().pluralize()
    }
    public func all(completion:@escaping ArrayCompletion) {
        // build URL for the object
        let path = BHURLBuilder.indexUrlForObject(model: self)!
        let request = URLRequest(url: path)
        let afrequest = BHRestManager.shared().httpManager.dataTask(with: request) { (response, collection, error) in
            if error != nil {
                print("error doing a thing")
                return
            }
            let sc = (response as! HTTPURLResponse).statusCode
            if sc != 200 {
                print("Unexpected status code: \(sc)")
                return
            }
            completion(collection as? [Any], error)
        }
        afrequest.resume()
    }
    
    /*
     Uses the Reflecting library to convert the attributes into a json structure. Example JSON output:
     { "book" : {"title" : "A Book", "author" : "an author" } }
    */
    internal func toJSON() -> Data? {
        var data:Data?
        var dict = [String:Any]()
        let wrapper = String(describing: type(of: self)).lowercased()
        
        let mirror = Mirror(reflecting: self)
        for (label, value) in mirror.children {
            dict[label!] = value
        }
        
        let outer = [wrapper : dict]
        do {
            data = try JSONSerialization.data(withJSONObject: outer, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        return data
    }
}
