//
//  BHRestManager.swift
//  Pods
//
//  Created by Brian Heller on 1/11/17.
//
//

import Foundation
import AFNetworking

public class BHRestManager {
    private static var sharedManager:BHRestManager!
    
    private var configuration:BHRestManagerConfiguration!
    internal var httpManager:AFURLSessionManager!
    
    /*
     A shared manager we will use throughout the library. This must be configured in the AppDelegate's didFinishLaunchingWithOptions method.
    */
    public static func shared() -> BHRestManager {
        if(sharedManager == nil) {
            sharedManager = BHRestManager()
        }
        return sharedManager
    }
    
    init() {
        // Create a new configuration object that can be used in the future.
        configuration = BHRestManagerConfiguration()
        // just use default config for now.
        let sessionConfig = URLSessionConfiguration.default
        httpManager = AFURLSessionManager(sessionConfiguration: sessionConfig)
    }
    /*
     Set the base URI for the server communication.
    */
    public func setBaseUri(uri:String) {
        // Add the base URI to the configuration. TODO: Validate this URI before doing this.
        configuration.setBaseUri(base: uri)
    }
    
    /*
     Returns the base URI for the server.
    */
    public func baseUri() -> String? {
        return configuration.getBaseUri()
    }
    
    /*
     Adds path components for the URI. e.g. api/v1
    */
    public func setAdditionalPathComponents(components:[String]) {
        configuration.setAdditionalComponents(components: components)
    }
    
    /*
     Gets a full URI for a server. This includes any additional components.
    */
    public func fullUri() -> String? {
        // Build the URI. TODO: Refactor this into a URIBuilder class
        var uri = configuration.getBaseUri()
        for component in configuration.getAdditionalComponents()! {
            uri = uri?.appending("\(component)/")
        }
        return uri
    }
    
    public func addAdditionalHeader(header:[String:String]) {
        configuration.addAdditionalHeader(headers: header)
    }
    
    public func additionalHeaders() -> [[String:String]]? {
        return configuration.getAdditionalHeaders()
    }
}
