//
//  UIColor.swift
//  finance
//
//  Created by Joao Pedro Messias Oliveira de Melo on 27/04/26.
//
import SwiftUI

extension Color {
    static let darkBlue = Color(red: 0.0, green: 0.1, blue: 0.4)
    static let primaryBlue = Color(red: 0.0, green: 0.4, blue: 0.8)
    static let deepNavy = Color(red: 0.02, green: 0.05, blue: 0.15)
    static let lemon = Color(red: 79, green: 100, blue: 58)
    
    init(hex: String) {
        // 1. Remove espaços em branco e quebras de linha
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // 2. Remove o prefixo "#" se ele existir
        if hexSanitized.hasPrefix("#") {
            hexSanitized.removeFirst()
        }
        
        // 3. Converte a string hexadecimal para UInt64
        var rgbValue: UInt64 = 0
    
        let scanner = Scanner(string: hexSanitized)
    
        guard scanner.scanHexInt64(&rgbValue) else {
            self = .white
            return
        }
        
        let r, g, b, a: Double
        
        // 4. Extrai os valores com base no tamanho do Hex (6 para RGB, 8 para RGBA)
        switch hexSanitized.count {
        case 6: // RGB (ex: "FF0000")
            r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            b = Double(rgbValue & 0x0000FF) / 255.0
            a = 1.0 // Opacidade total por padrão
            
        case 8: // RGBA (ex: "FF0000CC")
            r = Double((rgbValue & 0xFF000000) >> 24) / 255.0
            g = Double((rgbValue & 0x00FF0000) >> 16) / 255.0
            b = Double((rgbValue & 0x0000FF00) >> 8) / 255.0
            a = Double(rgbValue & 0x000000FF) / 255.0
            
        default:
            self = .white
            return
        }
        
        // 5. Inicializa o Color com os valores extraídos
        self.init(red: r, green: g, blue: b, opacity: a)
    }
}

enum ColorHexError: Error {
    case invalidFormat
}
