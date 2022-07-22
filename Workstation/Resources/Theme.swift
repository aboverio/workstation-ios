//
//  Theme.swift
//  Workstation
//
//  Created by Adam Rafiandri on 07/21/22.
//

import Foundation
import SwiftUI
import SwiftTheming

struct ThemeAsset: Assetable {
    enum ColorAsset {
        // Form Color Assets
        case formFieldBackground
        case formButtonBackground
    }
    
    enum ImageAsset {
        
    }
    
    enum FontAsset {
        
    }
    
    enum GradientAsset {
        
    }
}

class WorkstationTheme: Themed<ThemeAsset> {
    override func colorSet(for asset: ThemeAsset.ColorAsset) -> ColorSet {
        switch asset {
        case .formFieldBackground:
            return ColorSet(light: Color.gray, dark: Color.white)
        
        case .formButtonBackground:
            return ColorSet(default: Color.blue)
        }
    }
}

enum Theme: Themeable {
    case workstation
    
    func theme() -> Themed<ThemeAsset> {
        switch self {
        case .workstation: return WorkstationTheme()
        }
    }
}
