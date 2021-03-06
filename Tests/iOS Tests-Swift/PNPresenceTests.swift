//
//  PNPresenceTests.swift
//  PubNub Tests
//
//  Created by Jordan Zucker on 3/23/16.
//
//

import UIKit
import XCTest

class PNPresenceTests: PNBasicClientTestCase {
    
    override func isRecording() -> Bool {
        return false
    }
    
    let uniqueChannelName = "2EC925F0-B996-47A4-AF54-A605E1A9AEBA"
    let uniqueGroupName = "2EC925F0-B996-47A4-AF54-A605E1A9AEBA"
    
    func testHereNow() {
        let testExpectation = self.expectationWithDescription("network")
        
        self.client.hereNowWithCompletion { (result, status) -> Void in
            XCTAssertNil(status)
            XCTAssertEqual(result!.operation, PNOperationType.HereNowGlobalOperation, "Wrong operation")
            XCTAssertNotNil(result!.data)
            XCTAssertEqual(result!.statusCode, 200)
            
            let expectedChannels: ([String: NSDictionary]) = [
                "0_5098427633369088" : [
                    "occupancy" : 1,
                    "uuids" :
                    [[
                    "uuid" : "JejuFan--79001"
                    ]]
                ],
                "0_5650661106515968" :    [
                    "occupancy" : 1,
                    "uuids" :
                        [[
                        "uuid" : "JejuFan--79001"
                        ]]
                ],
                "all_activity" :         [
                    "occupancy" : 1,
                    "uuids" :
                    [[
                    "uuid" : "JejuFan--79001"
                    ]]
                ]
            ]
            
            let resultChannels = result!.data.channels
            
            XCTAssert(resultChannels == expectedChannels, "Result and expected channels are not equal.")
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5, handler: { (error) -> Void in
            XCTAssertNil(error, "Encountered error with publish call")
        })
    }
    
    func testHereNowWithVerbosityNowUUID() {
        let testExpectation = self.expectationWithDescription("network")
        
        self.client.hereNowWithVerbosity(PNHereNowVerbosityLevel.UUID, completion: { (result, status) -> Void in
            
            XCTAssertNil(status)
            XCTAssertEqual(result!.operation, PNOperationType.HereNowGlobalOperation, "Wrong operation")
            XCTAssertNotNil(result!.data)
            XCTAssertEqual(result!.statusCode, 200);
            
            let expectedChannels: ([String: NSDictionary]) = [
                "0_5098427633369088" :     [
                    "occupancy" : 1,
                    "uuids" :   ["JejuFan--79001"]
                ],
                "0_5650661106515968" :     [
                    "occupancy" : 1,
                    "uuids" :         [
                    "JejuFan--79001"
                    ]
                ],
                "all_activity" :     [
                    "occupancy" : 1,
                    "uuids" :         [
                    "JejuFan--79001"
                    ]
                ]]
            
            let resultChannels = result!.data.channels
            
            XCTAssert(resultChannels == expectedChannels, "Result and expected channels are not equal.")
            
            testExpectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(5, handler: { (error) -> Void in
            XCTAssertNil(error, "Encountered error with publish call")
        })
    }
    
    func testHereNowWithVerbosityNowState() {
        let testExpectation = self.expectationWithDescription("network")
        
        self.client.hereNowWithVerbosity(PNHereNowVerbosityLevel.State, completion: { (result, status) -> Void in
            
            XCTAssertNil(status)
            XCTAssertEqual(result!.operation, PNOperationType.HereNowGlobalOperation, "Wrong operation")
            XCTAssertNotNil(result!.data)
            XCTAssertEqual(result!.statusCode, 200);
            
            let expectedChannels: ([String: NSDictionary]) = [
                "0_5098427633369088" : [
                    "uuids" : [
                    [
                    "uuid" : "JejuFan--79001"
                    ]
                    ],
                    "occupancy" : 1
                ],
                "0_5650661106515968" : [
                    "uuids" : [
                    [
                    "uuid" : "JejuFan--79001"
                    ]
                    ],
                    "occupancy" : 1
                ],
                "all_activity" : [
                    "uuids" : [
                    [
                    "uuid" : "JejuFan--79001"
                    ]
                    ],
                    "occupancy" : 1
            ]
            ]
            let resultChannels = result!.data.channels
            
            XCTAssert(resultChannels == expectedChannels, "Result and expected channels are not equal.")
            
            testExpectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(5, handler: { (error) -> Void in
            XCTAssertNil(error, "Encountered error with publish call")
        })
    }
    
    func testHereNowWithVerbosityNowOccupancy() {
        let testExpectation = self.expectationWithDescription("network")
        
        self.client.hereNowWithVerbosity(PNHereNowVerbosityLevel.Occupancy, completion: { (result, status) -> Void in
            
            XCTAssertNil(status)
            XCTAssertEqual(result!.operation, PNOperationType.HereNowGlobalOperation, "Wrong operation")
            XCTAssertNotNil(result!.data)
            XCTAssertEqual(result!.statusCode, 200);
            
            let expectedChannels: ([String: NSDictionary]) = [
                "0_5098427633369088" : [
                    "occupancy" : 1
                ],
                "0_5650661106515968" : [
                    "occupancy" : 1
                ],
                "all_activity" : [
                    "occupancy" : 1
                ]]
            
            let resultChannels = result!.data.channels
            
            XCTAssert(resultChannels == expectedChannels, "Result and expected channels are not equal.")
            
            testExpectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(5, handler: { (error) -> Void in
            XCTAssertNil(error, "Encountered error with publish call")
        })
    }
    
    func testHereNowForChannel() {
        let testExpectation = self.expectationWithDescription("network")
        
        self.client.hereNowForChannel(uniqueChannelName, withCompletion: { (result, status) -> Void in
            
            XCTAssertNil(status)
            XCTAssertEqual(result!.operation, PNOperationType.HereNowForChannelOperation, "Wrong operation")
            XCTAssertNotNil(result!.data)
            XCTAssertEqual(result!.statusCode, 200);
            
            XCTAssertEqual(result!.data.occupancy, 0, "Result and expected channels are not equal.")
            XCTAssert(result!.data.uuids as! NSArray ==  [], "Result and expected channels are not equal.")
            
            testExpectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(5, handler: { (error) -> Void in
            XCTAssertNil(error, "Encountered error with publish call")
        })
    }
    
    func testHereNowForChannelWithVerbosityOccupancy() {
        let testExpectation = self.expectationWithDescription("network")
        
        self.client.hereNowForChannel(uniqueChannelName, withVerbosity: PNHereNowVerbosityLevel.Occupancy) { (result, status) -> Void in
            XCTAssertNil(status)
            XCTAssertEqual(result!.operation, PNOperationType.HereNowForChannelOperation, "Wrong operation")
            XCTAssertNotNil(result!.data)
            XCTAssertEqual(result!.statusCode, 200);
            
            XCTAssertEqual(result!.data.occupancy, 0, "Result and expected channels are not equal.")
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5, handler: { (error) -> Void in
            XCTAssertNil(error, "Encountered error with publish call")
        })
    }
    
    func testHereNowForChannelWithVerbosityState() {
        let testExpectation = self.expectationWithDescription("network")
        
        self.client.hereNowForChannel(uniqueChannelName, withVerbosity: PNHereNowVerbosityLevel.State) { (result, status) -> Void in
            XCTAssertNil(status)
            XCTAssertEqual(result!.operation, PNOperationType.HereNowForChannelOperation, "Wrong operation")
            XCTAssertNotNil(result!.data)
            XCTAssertEqual(result!.statusCode, 200);
            
            XCTAssertEqual(result!.data.occupancy, 0, "Result and expected channels are not equal.")
            XCTAssert(result!.data.uuids as! NSArray ==  [], "Result and expected channels are not equal.")
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5, handler: { (error) -> Void in
            XCTAssertNil(error, "Encountered error with publish call")
        })
    }
    
    func testHereNowForChannelWithVerbosityUUID() {
        let testExpectation = self.expectationWithDescription("network")
        
        self.client.hereNowForChannel(uniqueChannelName, withVerbosity: PNHereNowVerbosityLevel.UUID) { (result, status) -> Void in
            XCTAssertNil(status)
            XCTAssertEqual(result!.operation, PNOperationType.HereNowForChannelOperation, "Wrong operation")
            XCTAssertNotNil(result!.data)
            XCTAssertEqual(result!.statusCode, 200);
            
            XCTAssertEqual(result!.data.occupancy, 0, "Result and expected channels are not equal.")
            XCTAssert(result!.data.uuids as! NSArray ==  [], "Result and expected channels are not equal.")
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5, handler: { (error) -> Void in
            XCTAssertNil(error, "Encountered error with publish call")
        })
    }

    func testHereNowForChannelGroup() {
        let testExpectation = self.expectationWithDescription("network")
        
        self.client.hereNowForChannelGroup(uniqueGroupName, withCompletion: { (result, status) -> Void in
            XCTAssertNil(status)
            XCTAssertEqual(result!.operation, PNOperationType.HereNowForChannelGroupOperation, "Wrong operation")
            XCTAssertNotNil(result!.data)
            XCTAssertEqual(result!.statusCode, 200);
            
            XCTAssert(result!.data.channels as NSDictionary == [:], "Result and expected channels are not equal.")
            
            testExpectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(5, handler: { (error) -> Void in
            XCTAssertNil(error, "Encountered error with publish call")
        })
    }
    
    func testHereNowForChannelGroupWithVerbosityOccupancy() {
        let testExpectation = self.expectationWithDescription("network")
        
        self.client.hereNowForChannelGroup(uniqueGroupName, withVerbosity: PNHereNowVerbosityLevel.Occupancy) { (result, status) -> Void in
            XCTAssertNil(status)
            XCTAssertEqual(result!.operation, PNOperationType.HereNowForChannelGroupOperation, "Wrong operation")
            XCTAssertNotNil(result!.data)
            XCTAssertEqual(result!.statusCode, 200);
            
            XCTAssert(result!.data.channels as NSDictionary ==  [:], "Result and expected channels are not equal.")
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5, handler: { (error) -> Void in
            XCTAssertNil(error, "Encountered error with publish call")
        })
    }
    
    func testHereNowForChannelGroupWithVerbosityState() {
        let testExpectation = self.expectationWithDescription("network")
        
        self.client.hereNowForChannelGroup(uniqueGroupName, withVerbosity: PNHereNowVerbosityLevel.State) { (result, status) -> Void in
            XCTAssertNil(status)
            XCTAssertEqual(result!.operation, PNOperationType.HereNowForChannelGroupOperation, "Wrong operation")
            XCTAssertNotNil(result!.data)
            XCTAssertEqual(result!.statusCode, 200);
            
            XCTAssert(result!.data.channels as NSDictionary ==  [:], "Result and expected channels are not equal.")
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5, handler: { (error) -> Void in
            XCTAssertNil(error, "Encountered error with publish call")
        })
    }

    func testHereNowForChannelGroupWithVerbosityUUID() {
        let testExpectation = self.expectationWithDescription("network")
        
        self.client.hereNowForChannelGroup(uniqueGroupName, withVerbosity: PNHereNowVerbosityLevel.UUID) { (result, status) -> Void in
            XCTAssertNil(status)
            XCTAssertEqual(result!.operation, PNOperationType.HereNowForChannelGroupOperation, "Wrong operation")
            XCTAssertNotNil(result!.data)
            XCTAssertEqual(result!.statusCode, 200);
            
            XCTAssert(result!.data.channels as NSDictionary ==  [:], "Result and expected channels are not equal.")
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5, handler: { (error) -> Void in
            XCTAssertNil(error, "Encountered error with publish call")
        })
    }

    
    func testWhereNowUDID() {
        let testExpectation = self.expectationWithDescription("network")
        
        let uuid = NSUUID().UUIDString
        
        self.client.whereNowUUID(uuid, withCompletion: { (result, status) -> Void in
            XCTAssertNil(status)
            XCTAssertEqual(result!.operation, PNOperationType.WhereNowOperation, "Wrong operation")
            XCTAssertNotNil(result!.data)
            XCTAssertEqual(result!.statusCode, 200);
            
            XCTAssert(result!.data.channels as NSArray ==  [], "Result and expected channels are not equal.")
            testExpectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(5, handler: { (error) -> Void in
            XCTAssertNil(error, "Encountered error with publish call")
        })
    }

}