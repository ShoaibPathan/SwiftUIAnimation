//
//  AvatarView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/14/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

/*
 Circle profile photos layout
*/

import SwiftUI

struct AvatarView: View {
    let image: String
    let size: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size)
            .cornerRadius(size / 2)
    }
}


