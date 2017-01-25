//
//  BHRestModel.swift
//  Pods
//
//  Created by Brian Heller on 1/14/17.
//
//

import Foundation
import EVReflection

typealias ArrayCompletion = (_ results:[Any]?, _ error:Error?) -> Void

open class BHRestModel {
    internal var path:String?

    public init() {
        self.path = String(describing: type(of: self)).lowercased().pluralize()
    }
    
    public init(data: Data) {
        self.path = String(describing: type(of: self)).lowercased().pluralize()
        BHRestModel.setProperties(data: data, object: self)
    }

    public func all(completion:ArrayCompletion) {
        // build URL for the object
        let path = BHURLBuilder.indexUrlForObject(model: self)!
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
    
    internal static func setProperties<T>(data: Data, object: T, objectKey:String? = nil) {
        do {
            let dict = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSDictionary
            let properties = ((objectKey == nil) ? dict : dict[objectKey]) as! NSDictionary
            for (key, value) in properties {
                print(key)
                print(value)
            }
        }
        catch let error {
            print("Encountered an error setting properties: \(error.localizedDescription)")
        }
    }
}
