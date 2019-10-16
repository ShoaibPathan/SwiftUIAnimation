//
//  TwitterHomeCell.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/16/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI

struct TwitterHomeCell: View {
    
    var data = dataModel
    
    var body: some View {
        
        
        List(data) {item in
            HStack(spacing: 6) {
                
                VStack(alignment: .leading) {
                    AvatarView(image: item.image, size: 50)
                    Spacer()
                }
                TwitterCardDescription(name: item.name, text: item.text)
            }
        }
            
        .tabItem({
            Image(systemName: "gear")
            Text("Twitter")
            
            
        })
    }
}
    
struct TwitterHomeCell_Previews: PreviewProvider {
    static var previews: some View {
        TwitterHomeCell()
        .environment(\.colorScheme, .dark)
    }
}
