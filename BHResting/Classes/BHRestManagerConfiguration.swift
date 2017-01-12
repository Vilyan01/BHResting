//
//  BHRestManagerConfiguration.swift
//  Pods
//
//  Created by Brian Heller on 1/11/17.
//
//

import Foundation

internal class BHRestManagerConfiguration {
    private var baseUri:String?
    private var additionalComponents:[String]?
    private var additionalHeaders:[[String:String]]?
    
    init() {
        additionalHeaders = [[String:String]]()
    }
    
    public func setBaseUri(base:String) {
        baseUri = base
    }
    
    public func getBaseUri() -> String? {
        return baseUri
    }
    
    public func setAdditionalComponents(components:[String]) {
        additionalComponents = components
    }
    
    public func getAdditionalComponents() -> [String]? {
        return additionalComponents
    }
    
    public func addAdditionalHeader(headers:[String:String]) {
        additionalHeaders?.append(headers)
    }
    
    public func getAdditionalHeaders() -> [[String:String]]? {
        return additionalHeaders
    }
}
