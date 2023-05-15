//
//  InitView.swift
//  CoreDataSwiftui
//
//  Created by MUNAVAR PM on 06/05/23.
//

import SwiftUI

struct InitView: View {
    
    let backgroundColour: Color
    let count:Int
    let title: String
    
    
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline()
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        
        .frame(width: 150,height: 150)
        .background(backgroundColour)
        .cornerRadius(16)
        
    }
}

struct InitView_Previews: PreviewProvider {
    static var previews: some View {
        InitView(backgroundColour: .red, count: 7, title: "CR7")
    }
}
