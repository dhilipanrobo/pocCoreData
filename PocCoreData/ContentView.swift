//
//  ContentView.swift
//  PocCoreData
//
//  Created by Apple on 11/04/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    let coreDataManager : CoreDataManager
    @State private var movieName : String = ""
    @State private var movies :[Movie] = [Movie]()
    private func popLateMovie(){
        movies = coreDataManager.fetchMovie()
    }
    var body: some View {
        NavigationView(content: {
            VStack {
                TextField("Movie Name", text: $movieName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    coreDataManager.SaveMovie(title: movieName)
                    popLateMovie()
                    movieName = ""
                }, label: {
                    Text("Save")
                })
                List{
                    ForEach ( movies,id:\.self)  { movie in
                        NavigationLink(destination: MoveDetail(movie: movie)) {  Text(movie.title ?? "") }
                        
                    }.onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            let movie = movies[index]
                            coreDataManager.deleteMovie(movies: movie)
                            popLateMovie()
                        }
                        
                    })
                }.listStyle(.plain)
                Spacer()
            }.padding()
                .task {
                    popLateMovie()
                }
        })
    }
}
#Preview {
    ContentView(coreDataManager: CoreDataManager())
}
