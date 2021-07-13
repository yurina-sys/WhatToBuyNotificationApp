//
//  LogOutput.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/07/14.
//

import Foundation

class LogOutput {
    
    class func log(_ message: String = "", file: String = #file, function: String = #function, line: Int = #line) {
        print(self.createLogMessage(message, file: file, function: function, line: line))
    }
    
    class func errorLog(_ message: String = "", error: Error, file: String = #file, function: String = #function, line: Int = #line) {
        print(self.createLogMessage(message, error: error, file: file, function: function, line: line))
    }
    
    private class func createLogMessage(_ message: String, error: Error? = nil, file: String, function: String, line: Int) -> String {
        var logMessage = Date().getNowDateTimeCompleteness()
        
        if let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            logMessage += " [\(bundleName)]"
        }
        
        if let swiftFile = file.split(separator: "/").last?.split(separator: ".").first {
            logMessage += " [\(String(swiftFile))]"
        }
        
        logMessage += " <\(function)>"
        logMessage += " [l: \(line)] "
        logMessage += message
        
        if let error = error {
            logMessage += "\n\(error)"
        }
        
        return logMessage
    }
}
