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
		let workingPurse = self

		let andTheCat = "and the cat"
		let recipients = party + [andTheCat]
		let count = recipients.count

		let platina = workingPurse.platinum.quotientAndRemainder(dividingBy: count)
		let golds = workingPurse.gold.quotientAndRemainder(dividingBy: count)
		let electra = workingPurse.electrum.quotientAndRemainder(dividingBy: count)
		let silvers = workingPurse.silver.quotientAndRemainder(dividingBy: count)
		let coppers = workingPurse.copper.quotientAndRemainder(dividingBy: count)

		let baseWallet = Purse(platinum: platina.quotient, gold: golds.quotient, electrum: electra.quotient, silver: silvers.quotient, copper: coppers.quotient)
		let remainderWallet = Purse(platinum: platina.remainder, gold: golds.remainder, electrum: electra.remainder, silver: silvers.remainder, copper: coppers.remainder)

		let wallets = Array(repeating: baseWallet, count: recipients.count)

		var assigned = Dictionary(zip(recipients, wallets), uniquingKeysWith: { this, that in return this })
		assigned[andTheCat]? += remainderWallet

		return assigned
	}
}
