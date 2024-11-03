//
//  String.swift
//  store
//
//  Created by Kehinde Bankole on 02/11/2024.
//
import SwiftUI

extension String {
    var capitalizedSentence: String {
        // 1
        let firstLetter = self.prefix(1).capitalized
        // 2
        let remainingLetters = self.dropFirst().lowercased()
        // 3
        return firstLetter + remainingLetters
    }
}
