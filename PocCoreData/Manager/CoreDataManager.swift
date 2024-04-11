//
//  CoreDataManager.swift
//  PocCoreData
//
//  Created by Apple on 11/04/24.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let presistentContainert : NSPersistentContainer
    init() {
        presistentContainert = NSPersistentContainer(name: "PocCoreData")
        presistentContainert.loadPersistentStores { (description, error) in
            
            if let error = error {
                fatalError("Core data store failed to init\(error.localizedDescription)")
            }
        }
        
    }
    
    //MARK: -Save Data
    
    func SaveMovie(title:String) {
        let movie = Movie(context: presistentContainert.viewContext)
        movie.title = title
        do{
            try presistentContainert.viewContext.save()
            print("Data saved! ")
        }catch{
          print("Save data get error \(error)")
        }
    }
    
    //MARK: - Fetch Data
    
    func fetchMovie() -> [Movie] {
        let fetchRequest:NSFetchRequest<Movie> = Movie.fetchRequest()
        do {
            return try presistentContainert.viewContext.fetch(fetchRequest)
        }catch{return []}
    }
    
    //MARK: - Delete Data
    
    func deleteMovie(movies:Movie) {
        
        presistentContainert.viewContext.delete(movies)
        
        do{
            try presistentContainert.viewContext.save()
        }catch{
             presistentContainert.viewContext.rollback()
            print ("fail to delete \(error.localizedDescription)")
        }
    }
    
//MARK: - Update Data
    
    
    func UpdateMovie() {
       
        do{
            try presistentContainert.viewContext.save()
            print("Data saved! ")
        }catch{
            presistentContainert.viewContext.rollback()
          print("Save data get error \(error)")
        }
    }
    
}
