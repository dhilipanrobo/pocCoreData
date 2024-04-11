//
//  PocCoreDataApp.swift
//  PocCoreData
//
//  Created by Apple on 11/04/24.
//

import SwiftUI

@main
struct PocCoreDataApp: App {
   

    var body: some Scene {
        WindowGroup {
            ContentView(coreDataManager: CoreDataManager())
        }
    }
}
