//
//  WhatState.swift
//  CoreDataSwiftui
//
//  Created by MUNAVAR PM on 07/05/23.
//

import SwiftUI

struct WhatState: View {
    var body: some View {
        
        @State var backgroundColor: Color = Color.green
        @State var myTitile: String = ""
        
        ZStack {
            Color.red
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Munavar")
                    .font(.title)
                Text("Count")
                    .font(.title)
                    .underline()
                
                HStack(spacing: 20) {
                    Button("Button 1") {
                        <#code#>
                    }
                    Button("Button 2") {
                        <#code#>
                    }
                }
            }
        }
    }
}

struct WhatState_Previews: PreviewProvider {
    static var previews: some View {
        WhatState()
    }
}
