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
    internal var jsonProperties:[String]?
    
    
    public init() {
        self.path = String(describing: type(of: self)).lowercased().pluralize()
    }
    
    public func create() -> Bool {
        return true
    }
    
    public static func find(id:Int) -> BHRestModel {
        return BHRestModel()
    }
    
    public static func all() -> Bool {
        return true
    }
    
    public func delete() -> Bool {
        return true
    }
    
    public func update() -> Bool {
        return true
    }
    
    /*
     Uses the Reflecting library to convert the attributes into a json structure. Example JSON output:
     { "book" : {"title" : "A Book", "author" : "an author" } }
    */
    internal func toJSON() -> Data? {
        // check to see if the class has been configured yet
        var data:Data?
        var dict = [String:Any]()
        
        // Get the class name of the object for the JSON payload.
        let base = String(describing: type(of: self)).lowercased()
        
        // Use the reflecting library to copy attributes into a dict
        let mirror = Mirror(reflecting: self)
        for case let (label?, value) in mirror.children {
            dict[label] = value
        }
        
        // create wrapper dict
        let wrapper = [base : dict]
        
        // convert the dict into JSON
        do {
            data = try JSONSerialization.data(withJSONObject: wrapper, options: .prettyPrinted)
        }
        catch let error {
            print("Caught error")
        }
        return data
    }
}
