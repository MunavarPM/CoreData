//
//  ForeEach.swift
//  CoreDataSwiftui
//
//  Created by MUNAVAR PM on 07/05/23.
//

import SwiftUI

struct ForeEach: View {
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: true, content: {
                VStack {
                ForEach(0..<10){ index in
                    
                    ScrollView(.horizontal,showsIndicators: true, content:{
                        HStack {
                            ForEach(0..<29) { index in
                                RoundedRectangle(cornerRadius: 29)
                                   .fill(Color.white)
                                   .frame(width: 200, height: 220)
                                   .shadow(radius: 20)
                                   .padding()
                            }
                             
                                
                        }

                    })
                                        
                    
                }
            }
            })
            ScrollView{
        }
    }
}

struct ForeEach_Previews: PreviewProvider {
    static var previews: some View {
        ForeEach()
    }
}
