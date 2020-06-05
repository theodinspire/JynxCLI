//
//  CoinTests.swift
//  JynxTests
//
//  Created by Eric T Cormack on 6/5/20.
//  Copyright © 2020 Eric T Cormack. All rights reserved.
//

import XCTest
@testable import Jynx

class CoinTests: XCTestCase {

	func testPlatinumIsWorth1000() {
		XCTAssertEqual(Coins.Platinum.value, 1_000)
	}
	
	func testPlatinumIsOnePlatinum() {
		XCTAssertEqual(Coins.Platinum.platinum, 1)
	}

	func testGoldIsWorth100() {
		XCTAssertEqual(Coins.Gold.value, 100)
	}
	
	func testGoldIsOneGold() {
		XCTAssertEqual(Coins.Gold.gold, 1)
	}

	func testElectrumIsWorth50() {
		XCTAssertEqual(Coins.Electrum.value, 50)
	}
	
	func testElectrumIsOneElectrum() {
		XCTAssertEqual(Coins.Electrum.electrum, 1)
	}

	func testSilverIsWorth10() {
		XCTAssertEqual(Coins.Silver.value, 10)
	}
	
	func testSilverIsOneSilver() {
		XCTAssertEqual(Coins.Silver.silver, 1)
	}

	func testCopperIsWorth1() {
		XCTAssertEqual(Coins.Copper.value, 1)
	}
	
	func testCopperIsOneCopper() {
		XCTAssertEqual(Coins.Copper.copper, 1)
	}

}
