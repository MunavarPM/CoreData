//
//  TransitionFun.swift
//  CoreDataSwiftui
//
//  Created by MUNAVAR PM on 10/05/23.
//

import SwiftUI

struct TransitionFun: View {
    @State var showView: Bool = false
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            Button {
                showView.toggle()
            } label: {
                Text("BUtton")
                    .foregroundColor(.yellow)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(10))
            }
            .sheet(isPresented: $showView) {
                Text("Drqaihsa")
            }
        }
    }
}

struct TransitionFun_Previews: PreviewProvider {
    static var previews: some View {
        TransitionFun()
    }
}
