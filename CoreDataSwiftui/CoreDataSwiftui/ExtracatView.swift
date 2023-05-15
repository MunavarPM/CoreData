//
//  ExtracatView.swift
//  CoreDataSwiftui
//
//  Created by MUNAVAR PM on 09/05/23.
//

import SwiftUI

struct ExtracatView: View {
    var body: some View {
        ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("1")
                Text("Apple")
                }
            .padding()
            .background(.yellow)
            .cornerRadius(15)
            }
        }
   
    }


struct ExtracatView_Previews: PreviewProvider {
    static var previews: some View {
        ExtracatView()
    }
}
