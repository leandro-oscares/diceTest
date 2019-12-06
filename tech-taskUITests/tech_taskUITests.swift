//
//  tech_taskUITests.swift
//  tech-taskUITests
//
//  Created by Leighroy on 28/10/2019.
//  Copyright © 2019 DICE FM. All rights reserved.
//


// I've decided to give the test those names to match the tasks requested so they are easier to be identify. Usually they will be named based their functionality.

import XCTest

class tech_taskUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    func testWaitingForLoadingStateToFinishAfterSelectionBeyonce(){
        
        let actions = Actions()
        let loadings = LoadingStates()
        let name = "Beyonce"
        
        actions.tapArtist(artist: name)  // Taps on the cell with the indicated name
        loadings.verifyLoadingState()  // Checks the Finish loading message and loading states are displayed
    }
    
    func testHandlingLocationPermissionSelectingAllowOnce(){
        let actions = Actions()
        let name = "Frank Sinatra"
        let locationStatus = "Authorized"
        let alertName = "Location Services"
        let alertButtonName = "Allow Once"
        let monitor = addUIInterruptionMonitor(withDescription: alertName) { (alert) -> Bool in
            alert.buttons[alertButtonName].tap()
            return true
        } // Monitors the alert and when displayed it taps the selected option
        
        actions.tapArtist(artist: name)  // Taps on the artis cell
        actions.tapGetLocation()  // This will trigger the alert
        actions.appFocus() // Gets the app back to focus
        actions.checkAuthorization(status: locationStatus)
        
        removeUIInterruptionMonitor(monitor) // removes the monitor to prevent unwanted issues with other tests
        
    }
    
    func testHandlingLocationPermissionsSelectingAllowWhileUsingApp() {
        
        let actions = Actions()
        let name = "Frank Sinatra"
        let locationStatus = "Authorized"
        let alertName = "Location Services"
        let alertButtonName = "Allow While Using App"
        let monitor = addUIInterruptionMonitor(withDescription: alertName) { (alert) -> Bool in
            alert.buttons[alertButtonName].tap()
            return true
        } // Monitors the alert and when displayed it taps the selected option
        
        actions.tapArtist(artist: name)
        actions.tapGetLocation()
        actions.appFocus()
        actions.checkAuthorization(status: locationStatus)
        
        removeUIInterruptionMonitor(monitor) // Removes the monitor to prevent unwanted issues with the other tests
        LocationPermissionsUtils().cleanUp() // Clears the location permits so the next test can triggers the alert again. This is so that we dont have unistall/install the app again to reset permissions granted by the test
    }
    
    func testHandlingLocationPermissionsSelectingDeny() {
        let actions = Actions()
        let name = "Frank Sinatra"
        let locationStatus = "Denied"
        let alertName = "Location Services"
        let alertButtonName = "Don’t Allow"
        let monitor = addUIInterruptionMonitor(withDescription: alertName) { (alert) -> Bool in
            alert.buttons[alertButtonName].tap()
            return true
        } // Monitors the alert and when displayed it taps the selected option
        
        actions.tapArtist(artist: name)
        actions.tapGetLocation()
        actions.appFocus()
        actions.checkAuthorization(status: locationStatus)
        
        removeUIInterruptionMonitor(monitor) // Removes the monitor to prevent unwanted issues with the other tests
        LocationPermissionsUtils().cleanUp() // Clears the location permits so the next test can triggers the alert again. This is so that we dont have unistall/install the app again to reset permissions granted by the test
        
    }
    
    
    func testArtistPageHasLoadedCorrectly() {
        
        let name = "Jimi Hendrix"
        let actions = Actions()
        let loadingStates = LoadingStates()
        
        actions.tapArtist(artist: name) // Open the artist page
        loadingStates.verifyArtistPage(artist: name) // Checks the page is displayed
        
    }
}



