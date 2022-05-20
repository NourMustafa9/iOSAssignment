//
//  Extensions.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 20/05/2022.
//

import Foundation
extension String {
    
    var isWhitespace: Bool {
        guard !isEmpty else { return true }
        
        let whitespaceChars = NSCharacterSet.whitespacesAndNewlines
        
        return self.unicodeScalars
            .filter { !whitespaceChars.contains($0) }
            .count == 0
    }
    
}

extension Optional where Wrapped == String {
    
    var isNullOrWhitespace: Bool {
        return self?.isWhitespace ?? true
    }
    
}
