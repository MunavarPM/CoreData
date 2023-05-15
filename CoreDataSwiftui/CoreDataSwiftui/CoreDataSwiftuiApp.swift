//
//  CoreDataSwiftuiApp.swift
//  CoreDataSwiftui
//
//  Created by MUNAVAR PM on 04/05/23.
//

import SwiftUI

@main
struct CoreDataSwiftuiApp: App {
    //it was the singleTon we use this on entire app only have one instance
    let persistenceController = PersistenceController.shared
    //it for the view purpose in appSQLlite
    init() {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(url[url.count - 1 ] as URL)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            //contentView can took what ever we put in the  .environment
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
