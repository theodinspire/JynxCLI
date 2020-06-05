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
		let wallets = Array(repeating: Purse(), count: recipients.count)
		
		let assigned = Dictionary(zip(recipients, wallets), uniquingKeysWith: { this, that in return this })
		
		return assigned
	}
}
