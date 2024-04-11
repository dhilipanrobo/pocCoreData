//
//  MoveDetail.swift
//  PocCoreData
//
//  Created by Apple on 11/04/24.
//

import SwiftUI


struct MoveDetail: View {
    let coreDataManager = CoreDataManager()
    let movie : Movie
    @State private var movieName : String = ""
    var body: some View {
        VStack(spacing: 8, content: {
            TextField(movie.title ?? "", text: $movieName)
            Button(action: {
                if !movieName.isEmpty {
                    movie.title = movieName
                    coreDataManager.UpdateMovie()
                }
               
            }, label: {
                Text("UPDate")
            })
        })
      
        
    }
}


