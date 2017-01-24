//
//  BHURLBuilder.swift
//  Pods
//
//  Created by Brian Heller on 1/24/17.
//
//

import Foundation

internal class BHURLBuilder {
    internal static func indexUrlForObject(model:BHRestModel) -> URL? {
        if let baseUri = BHRestManager.shared().baseUri() {
            return URL(string: "\(baseUri)\(model.path!)")
        } else {
            print("BHURLBuilder encountered error: Base URI not set.")
            return nil
        }
    }
    
    internal static func urlForObject(model: BHRestModel, withIndex id:Int) -> URL? {
        if let baseUri = BHRestManager.shared().baseUri() {
            return URL(string: "\(baseUri)\(model.path!)/\(id)")
        }
        else {
            print("BHURLBuilder encountered error: Base URI not set.")
            return nil
        }
    }
}
