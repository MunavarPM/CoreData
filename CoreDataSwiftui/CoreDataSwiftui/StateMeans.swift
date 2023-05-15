//
//  StateMeans.swift
//  CoreDataSwiftui
//
//  Created by MUNAVAR PM on 07/05/23.
//

import SwiftUI

struct StateMeans: View {
    
    @State var backgoundColour: Color = Color.gray
    @State var myTittle: String = "MY TITTlE"
    @State var Count: Int = 0
    
    var body: some View {
        ZStack() {
            backgoundColour
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Text(myTittle)
                    .font(.title)
                Text("count = \(Count)")
                    .font(.title)
                    .underline()
                HStack(spacing: 20) {
                    Button("PREES") {
                        backgoundColour = .red
                        myTittle = "1st BUTTON"
                        Count += 1
                    }
                    Button("PRESS") {
                        backgoundColour = .brown
                        myTittle = "2nd BUTTON"
                        Count += 1
                    }
                }
                .foregroundColor(.black)
            }
                
        }
    }
}

struct StateMeans_Previews: PreviewProvider {
    static var previews: some View {
        StateMeans()
    }
}
