//
//  Actions.swift
//  tech-taskUITests
//
//  Created by Guesty on 06/12/2019.
//  Copyright © 2019 DICE FM. All rights reserved.
//

import Foundation
import XCTest

class Actions {
    let app = XCUIApplication()
    
    func tapGetLocation() {
        app.buttons["Get Location"].tap()
        return
    }
    
    func tapArtist(artist: String) {
        app.tables.staticTexts[artist].tap()
        return
    }
    
    func appFocus() {
        app.tap()
        return
    }
    
    func checkAppIsAutorized () {
       var authorizedIsDisplayed : Bool {
            return app.staticTexts["Authorized"].waitForExistence(timeout: 10)
        }
        
        XCTAssertTrue(authorizedIsDisplayed)
        return
    }
    
    func checkAppIsNotAuthorized() {
        var deniedIsDisplayed : Bool {
            return app.staticTexts["Denied"].waitForExistence(timeout: 10)
        }
        
        XCTAssertTrue(deniedIsDisplayed)
        return
    }
    
    func checkAuthorization(status: String){
        var statusIsDisplayed : Bool {
            return app.staticTexts[status].waitForExistence(timeout: 10)
        }
        XCTAssertTrue(statusIsDisplayed)
        return
    }
    
}
