//
//  ListEdit,Delect,Add,Move.swift
//  CoreDataSwiftui
//
//  Created by MUNAVAR PM on 10/05/23.
//

import SwiftUI

struct ListEdit_Delect_Add_Move: View {
    @State var fruits: [String] = [
        "apple","banana","orange"
    ]
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Fruits")) {
                    ForEach (fruits, id: \.self){ index in
                        Text(index.capitalized)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationTitle("Glocery Items😘")
            .navigationBarItems(leading: EditButton(),trailing: Button("ADD", action: {
                fruits.append("Melbery")
            }))

        }
    
    }
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
        
    }
    //indices referce were from started and newOffset were to replace
    func move(indices: IndexSet, newOffset: Int){
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    
}

struct ListEdit_Delect_Add_Move_Previews: PreviewProvider {
    static var previews: some View {
        ListEdit_Delect_Add_Move()
    }
}
