//
//  LoadingStates.swift
//  tech-taskUITests
//
//  Created by Guesty on 06/12/2019.
//  Copyright © 2019 DICE FM. All rights reserved.
//

import Foundation
import XCTest

class LoadingStates {
    
    let app = XCUIApplication()
    
    func verifyLoadingState() {
        var finishLoadingIsDisplayed: Bool {
            return app.staticTexts["Finished Loading"].waitForExistence(timeout: 10)
        }
        
        var loadedIsDisplayed: Bool {
            return app.staticTexts["loaded"].waitForExistence(timeout: 5)
        }
        
        XCTAssert(finishLoadingIsDisplayed)
        XCTAssert(loadedIsDisplayed)
        return
    }
    
    
    func verifyArtistPage(artist : String) {
        var artistPageIsDisplayed : Bool {
            return app.staticTexts["Artist page for " + (artist) ].waitForExistence(timeout: 5)
        }
            XCTAssertTrue(artistPageIsDisplayed)
            return
        }
    
}
