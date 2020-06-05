//
//  Purse+SharingTests.swift
//  JynxTests
//
//  Created by Eric T Cormack on 6/5/20.
//  Copyright © 2020 Eric T Cormack. All rights reserved.
//

import XCTest
import Jynx

class Purse_SharingTests: XCTestCase {

	func testDividePlusTheCatProducesOneMorePurseThanPartyMembers() {
		// Arrange
		let party: Set<String> = ["Alpha", "Bravo", "Charlie"]
		let purse = Purse(platinum: 1, gold: 2, electrum: 3, silver: 4, copper: 5)
		
		// Act
		let spoils = purse.divide(among: party, using: .EqualPlusTheCat)
		
		// Assert
		XCTAssertEqual(spoils.count, party.count + 1)
	}
	
	func testDividePlusTheCatProducesEqualValuesForPartyMembers() {
		// Arrange
		let party: Set<String> = ["Alpha", "Bravo", "Charlie"]
		let purse = Purse(platinum: 1, gold: 2, electrum: 3, silver: 4, copper: 5)
		
		// Act
		let spoils = purse.divide(among: party, using: .EqualPlusTheCat)
		
		// Assert
		let targets = spoils.filter({ party.contains($0.key) }).values.map({ $0.value })
		
		XCTAssert(targets.allSatisfy({ $0 == targets[0] }))
	}
	
	func testDividePlusTheCatGivesValue() {
		// Arrange
		let alpha = "Alpha"
		let party: Set<String> = [alpha, "Bravo", "Charlie"]
		let purse = Purse(platinum: 4)
		
		// Act
		let spoils = purse.divide(among: party, using: .EqualPlusTheCat)
		
		// Assert
		XCTAssertGreaterThan(spoils[alpha]?.value ?? 0, 0)
	}

	func testDividePlusTheCatReturnsSameValueAsInput() {
		// Arrange
		let alpha = "Alpha"
		let party: Set<String> = [alpha, "Bravo", "Charlie"]
		let purse = Purse(platinum: 4, gold: 4, electrum: 4, silver: 4, copper: 4)

		// Act
		let spoils = purse.divide(among: party, using: .EqualPlusTheCat)
		let spoilValue = spoils.values.reduce(0) { $0 + $1.value }

		// Assert
		XCTAssertEqual(spoilValue, purse.value)
	}

}
