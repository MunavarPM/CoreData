//
//  ContentView.swift
//  CoreDataSwiftui
//
//  Created by MUNAVAR PM on 04/05/23.
//

import SwiftUI
import CoreData

//The all thingsa are performed by the @Fetchrequest how? because we are took entity by using the @Environmrnt he was push the Enity by container.ViewContext and here we took that by using the same concept and we update it delete it save it ....

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    //its for view in the ascending order.
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Fruits.name, ascending: true)],
        animation: .default)
    private var fruits: FetchedResults<Fruits>
    
    @State var textFieldText: String = ""
    
    var body: some View {
        //here is we going to add the item by the user preferrence.
        NavigationView {
            VStack(spacing: 20) {
                
                TextField("Add You're Fruit Here..✨",text: $textFieldText)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .padding(.leading)
                    .underline()
                     
                      
                        Button(action: {
                            // tigger the button wego to theh addItem() that process the function
                            addItem()
                        }, label: {
                            Text("SUMBIT")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(Color(#colorLiteral(red: 0.02263241448, green: 0, blue: 0.1583061814, alpha: 1)))
                                .cornerRadius(20)
                        })
                        .padding(.horizontal)

                    

                
                List {
                    
                    ForEach(fruits) { fruit in
                            Text(fruit.name ?? "")
                            .foregroundColor(.red)
                            .onAppear {
                                print(type(of: fruits))
                                print("vjdshgfkjaghfjkgdjfgdjfgdjfjdhagfjdsgfjsdgfhadgfjhgdskjfgdkjgfjdagfj \n gfajhgsfjh")
                                print(type(of: fruit))
                            }
                            .onTapGesture {
                                updateItem(fruit: fruit)
                            }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            
            .navigationBarTitle("Fruits🤤")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }

            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newFruit = Fruits(context: viewContext)
            newFruit.name = textFieldText
            
            saveItem()
            textFieldText = ""
        }
    }
    // for updating the Item - get item -assaign - call the entiyt and update it.
    private func updateItem(fruit: Fruits) {
        withAnimation {
            let currentName = fruit.name ?? ""
            let newName = currentName + "!"
            fruit.name = newName
            
            saveItem()
        }
    }
    // find the index - remove from the viewContext and delete the item - save()
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            
            guard let intex = offsets.first else {return}
            let fruitsEntity = fruits[intex]
            viewContext.delete(fruitsEntity)
            saveItem()
            
        }
    }
    private func saveItem(){
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
