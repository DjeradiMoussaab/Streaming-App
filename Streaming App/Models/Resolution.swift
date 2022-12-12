//
//  Resolution.swift
//  Streaming App
//
//  Created by Moussaab Djeradi on 20/11/2022.
//

import Foundation

enum Resolution: Int, Identifiable, Comparable, CaseIterable{
    case p360
    case p720
    case p1080
    
    var id: Int { rawValue }
    
    var stringValue : String {
        switch self {
        case .p360: return "360p"
        case .p720: return "720p"
        case .p1080: return "1080p"
        }
    }
    
    static func ==(lhs: Resolution, rhs: Resolution) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
    
    static func <(lhs: Resolution, rhs: Resolution) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
