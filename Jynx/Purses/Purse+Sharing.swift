//
//  Purse+Sharing.swift
//  Jynx
//
//  Created by Eric T Cormack on 6/5/20.
//  Copyright © 2020 Eric T Cormack. All rights reserved.
//

import Foundation

extension Purse {
	public func divide(among party: Set<String>, using strategy: ShareStrategy) -> [String: Purse] {
		switch strategy {
		case .EqualPlusTheCat:
			return divideEqualyWithTheCat(among: party)
		}
	}
	
	private func divideEqualyWithTheCat(among party: Set<String>) -> [String: Purse] {
		let andTheCat = "and the cat"
		let recipients = party + [andTheCat]
		let count = recipients.count

		let (baseWallet, remainderWallet) = self.divideByMakingChange(accrossACountOf: count)

		let wallets = Array(repeating: baseWallet, count: recipients.count)

		var assigned = Dictionary(zip(recipients, wallets), uniquingKeysWith: { this, that in return this })
		assigned[andTheCat]? += remainderWallet

		return assigned
	}

	private func divideByMakingChange(accrossACountOf count: Int) -> (quotient: Purse, remainder: Purse) {
		let p = self.platinum.quotientAndRemainder(dividingBy: count)
		let g = (self.gold + (10 * p.remainder)).quotientAndRemainder(dividingBy: count)
		let e = (self.electrum + (2 * g.remainder)).quotientAndRemainder(dividingBy: count)
		let s = (self.silver + (5 * e.remainder)).quotientAndRemainder(dividingBy: count)
		let c = (self.copper + (10 * s.remainder)).quotientAndRemainder(dividingBy: count)

		let quotientPurse = Purse(platinum: p.quotient, gold: g.quotient, electrum: e.quotient, silver: s.quotient, copper: c.quotient)
		let remainderPurse = c.remainder * Coins.Copper

		return (quotientPurse, remainderPurse)
	}
}
