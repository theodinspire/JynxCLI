//
//  Purse.swift
//  Jynx
//
//  Created by Eric T Cormack on 6/5/20.
//  Copyright © 2020 Eric T Cormack. All rights reserved.
//

import Foundation

public struct Purse {
	public var platinum: Int = 0
	public var gold:     Int = 0
	public var electrum: Int = 0
	public var silver:   Int = 0
	public var copper:   Int = 0
	
	
	public init(platinum: Int = 0, gold: Int = 0, electrum: Int = 0, silver: Int = 0, copper: Int = 0) {
		self.init(gold: gold, electrum: electrum, silver: silver, copper: copper)
		self.platinum = platinum
	}
	
	public init(gold: Int = 0, electrum: Int = 0, silver: Int = 0, copper: Int = 0) {
		self.init(electrum: electrum, silver: silver, copper: copper)
		self.gold = gold
	}
	
	public init(electrum: Int = 0, silver: Int = 0, copper: Int = 0) {
		self.init(silver: silver, copper: copper)
		self.electrum = electrum
	}
	
	public init(silver: Int = 0, copper: Int = 0) {
		self.init(copper: copper)
		self.silver = silver
	}
	
	public init(copper: Int = 0) {
		self.copper = copper
	}
	
	public var value: Int {
		return copper + silver * 10 + electrum * 50 + gold * 100 + platinum * 1_000
	}
}

public extension Purse {
	static func +(_ this: Purse, _ that: Purse) -> Purse {
		return Purse(
			platinum: this.platinum + that.platinum,
			gold: this.gold + that.gold,
			electrum: this.electrum + that.electrum,
			silver: this.silver + that.silver,
			copper: this.copper + that.copper)
	}
	
	static func +=(_ this: inout Purse, _ that: Purse) {
		this = this + that
	}
}
