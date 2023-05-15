//
//  Grid.swift
//  CoreDataSwiftui
//
//  Created by MUNAVAR PM on 07/05/23.
//

import SwiftUI

struct Grid: View {
    let columns : [GridItem] = [
        GridItem(.flexible(),spacing: nil,alignment: nil),
        GridItem(.flexible(),spacing: nil,alignment: nil),
        GridItem(.flexible(),spacing: nil,alignment: nil)
  
    ]
    var body: some View {
        
        
        
            ScrollView {
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 440)
                LazyVGrid(columns: columns) {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .frame(height: 150)
                    }
                
                }

            }
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 440)
                LazyVGrid(columns: columns) {
                ForEach(0..<50) { index in
                    Rectangle()
                        .frame(height: 150)
                }

            }
        }
    }


struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid()
    }
}
