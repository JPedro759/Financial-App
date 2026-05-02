//
//  Email.swift
//  finance
//
//  Created by Joao Pedro Messias Oliveira de Melo on 02/05/26.
//

import Foundation

struct Email: Codable {
    let value: String
    
    init(_ value: String) throws {
        guard Email.isValid(value) else {
            throw DecodingError.dataCorrupted(
                .init(codingPath: [], debugDescription: "Invalid email")
            )
        }
        
        self.value = value
    }
    
    // Decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        
        try self.init(value)
    }
    
    // Encoding
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        try container.encode(value)
    }
    
    private static func isValid(_ email: String) -> Bool {
        let regex = #"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$"#
        return email.range(of: regex, options: [.regularExpression, .caseInsensitive]) != nil
    }
}

enum EmailError: Error {
    case invalidFormat
}
