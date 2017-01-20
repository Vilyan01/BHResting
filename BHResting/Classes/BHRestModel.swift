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
