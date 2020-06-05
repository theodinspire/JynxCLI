//
//  main.swift
//  JynxCLI
//
//  Created by Eric T Cormack on 6/5/20.
//  Copyright © 2020 Eric T Cormack. All rights reserved.
//

import Foundation
import Jynx

print("Hello, Party!")

// MARK: Characters
print("Enter a character name: ", terminator: "")
var characters: Set<String> = []

while let input = readLine() {
	if !input.isEmpty {
		characters.insert(input)
		break
	}
	
	print ("You must enter at least one character! Enter a character name: ", terminator: "")
}

repeat {
	print ("Enter another character, or press return to end: ", terminator: "")
	guard let input = readLine(), !input.isEmpty else { break }
	characters.insert(input)
} while true

// MARK: Loot
var findings = Purse()

print("Enter loot amount: ", terminator: "")
while let input = readLine(), !input.isEmpty {
	let items = input.split(separator: " ").compactMap { Int.init($0) }
	
	guard items.count >= 5 else {
		print("Could not parse a wallet from this input. Please enter loot amount: ", terminator: "")
		continue
	}
	
	findings += Purse(platinum: items[0], gold: items[1], electrum: items[2], silver: items[3], copper: items[4])
	
	print("Enter a loot amount, or press 'Enter' to end: ", terminator: "")
}

print(findings)

// MARK: Spoils
var spoils = findings.divide(among: characters, using: .EqualPlusTheCat)

for (character, purse) in spoils {
	print("\(character): \(purse)")
}
