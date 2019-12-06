//
//  ClearLocationPermits.swift
//  tech-taskUITests
//
//  Created by Guesty on 06/12/2019.
//  Copyright © 2019 DICE FM. All rights reserved.
//

import Foundation
import XCTest

class LocationPermissionsUtils {
    
    //I've decided to implement this as a class instead of using it the tearDown() method because it is only needed for a few tests and it can be considered as an expensive operation to execute unnecessarily, specially if the size of the tests suit grows considerably.
    
    func cleanUp() {
        //sets location permission to ask always so that other branches can be tested too. Not done as part of tearDown() so that it does not hinder other unrelated tests
        
        let settingsApp = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
        settingsApp.launch()
        
        settingsApp.tables.cells.staticTexts["Privacy"].tap()
        settingsApp.tables.cells.staticTexts["Location Services"].tap()
        
        var waitTechTask : Bool {
            return settingsApp.tables.cells.staticTexts["tech-task"].waitForExistence(timeout: 10)
        }
        
        settingsApp.tables.cells.staticTexts["tech-task"].tap()
        settingsApp.tables.cells.staticTexts["Ask Next Time"].tap()
        return
    }
    
}
