//
//  PurseTests.swift
//  JynxTests
//
//  Created by Eric T Cormack on 6/5/20.
//  Copyright © 2020 Eric T Cormack. All rights reserved.
//

import XCTest
@testable import Jynx

class PurseTests: XCTestCase {

	// MARK: Basic Value
	func testCopperWorth1() throws {
		let coppers = 1
		let copperValue = 1
		let sut = Purse(copper: coppers)
		
		XCTAssertEqual(sut.value, coppers * copperValue)
	}
	
	func testSilverWorth10() throws {
		let silvers = 1
		let silverValue = 10
		let sut = Purse(silver: silvers)
		
		XCTAssertEqual(sut.value, silvers * silverValue)
	}
	
	func testElectrumWorth50() throws {
		let electra = 1
		let electrumValue = 50
		let sut = Purse(electrum: electra)
		
		XCTAssertEqual(sut.value, electra * electrumValue)
	}
	
	func testGoldWorth100() throws {
		let golds = 1
		let goldValue = 100
		let sut = Purse(gold: golds)
		
		XCTAssertEqual(sut.value, golds * goldValue)
	}
	
	func testPlatinumWorth() throws {
		let platina = 1
		let platinumValue = 1_000
		let sut = Purse(platinum: platina)
		
		XCTAssertEqual(sut.value, platina * platinumValue)
	}
	
	// MARK: Addition
	func testAddingRetainsValue() throws {
		let this = Purse(platinum: 1, gold: 2, electrum: 3, silver: 4, copper: 5)
		let that = Purse(platinum: 9, gold: 8, electrum: 7, silver: 6, copper: 5)
		
		let sum = this + that
		
		XCTAssertEqual(sum.value, this.value + that.value)
	}
	
	func testAddAssignRetainsValue() throws {
		let this = Purse(platinum: 1, gold: 2, electrum: 3, silver: 4, copper: 5)
		let that = Purse(platinum: 9, gold: 8, electrum: 7, silver: 6, copper: 5)
		
		var sum = this
		sum += that
		
		XCTAssertEqual(sum.value, this.value + that.value)
	}

	// MARK: Scalar Multiplication
}
