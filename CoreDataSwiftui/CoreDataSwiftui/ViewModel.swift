//
//  ViewModel.swift
//  CoreDataSwiftui
//
//  Created by MUNAVAR PM on 14/05/23.
//

import SwiftUI


class FruitViewModel: ObservableObject {
    
    //it was took the update that happend in the @ObservalObject
    // * @Published was push the updation to FruitViewModel class
    
    @Published var fruitArray:[FruitsModel] = []
    @Published var isLOading: Bool = false
    
    init(){
        //for get the first init view
        getFruits()
    }
    
    func getFruits(){
        let fruit1 = FruitsModel(name: "Orange", count: 3)
        let fruit2 = FruitsModel(name: "Omega", count: 8)
        let fruit4 = FruitsModel(name: "yuo", count: 3)
        
        isLOading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit4)
            self.isLOading = false
        }
        
        
        
        
    }
    func deleteFruit(index: IndexSet){
        fruitArray.remove(atOffsets: index)
        
    }
}
struct FruitsModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}


struct ViewModel: View {
     
    //mainly use this for subViews
    // @StateObject  for creation / init /hold the value
    @ObservedObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            List {
                if fruitViewModel.isLOading {
                    ProgressView()
                }else{
                    ForEach(fruitViewModel.fruitArray) { fruits in
                        HStack {
                            Text("\(fruits.count)")
                                .font(.headline)
                                .foregroundColor(.mint)
                            Text(fruits.name)
                                .font(.body)
                        }
                        
                    }
                        .onDelete(perform: fruitViewModel.deleteFruit)
                }
                
            }
            .navigationTitle("Fruits🍎")
            .listStyle(GroupedListStyle())
            
            .navigationBarItems(trailing:
                                    NavigationLink(destination: secondScreen( fruitViewModel: fruitViewModel), label: {
                Image(systemName: "arrow.right")
                    .font(.title)
            })
            
            )
            
        }
        
    }
        
}
struct secondScreen: View {
    
    @Environment(\.presentationMode) var persent
    
    //passing the view take from the another View this the examble of @ObersedObject
    
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea(.all)
            
//            Button(action: {
//                persent.wrappedValue.dismiss()
//            }, label: {
//                Text("Back")
//                    .foregroundColor(.white)
//            })
            VStack {
                ForEach(fruitViewModel.fruitArray){ fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                    
                }
            }
        }
    }
}

struct ViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ViewModel()
      
    }
}
