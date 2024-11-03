//
//  Fonts.swift
//  store
//
//  Created by Kehinde Bankole on 02/11/2024.
//

import SwiftUI

extension Font{
    static func moriRegular(size : CGFloat = 16) -> Font {
        return .custom("PPMori-Regular", size: size)
    }
    
    static func moriSemiBold(size : CGFloat = 16) -> Font {
        return .custom("PPMori-SemiBold", size: size)
    }
}
