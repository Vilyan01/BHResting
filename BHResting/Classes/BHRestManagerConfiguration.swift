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
    
    internal func setBaseUri(base:String) {
        baseUri = base
    }
    
    internal func getBaseUri() -> String? {
        return baseUri
    }
    
    internal func setAdditionalComponents(components:[String]) {
        additionalComponents = components
    }
    
    internal func getAdditionalComponents() -> [String]? {
        return additionalComponents
    }
    
    internal func addAdditionalHeader(headers:[String:String]) {
        additionalHeaders?.append(headers)
    }
    
    internal func getAdditionalHeaders() -> [[String:String]]? {
        return additionalHeaders
    }
}
