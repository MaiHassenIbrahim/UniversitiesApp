//
//  UniversityLocalStorage.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import Foundation
import RealmSwift


//MARK: UniversityLocalStorage implementation
class UniversityLocalStorage: UniversityLocalStorageDataActions {
    func saveToLocalStorage(universities: [UniversityListResponse], completion: (()->Void)?) {
        do {
            let list = List<UniversityListResponse>()
            list.append(objectsIn: universities)
            try RealmStorage.shared.storeObjects(list)
            completion?()
        } catch (let error) {
            debugPrint("Error in saveToLocalStorage: ", error.localizedDescription)
        }
    }
    
    func getFromLocalStorage() -> [UniversityListResponse] {
        do {
            let objects = try RealmStorage.shared.getObjectsFromDB(UniversityListResponse.self)
            return objects.compactMap{$0 as? UniversityListResponse}
        } catch (let error) {
            debugPrint("Error in getFromLocalStorage: ", error.localizedDescription)
            return []
        }
    }
    
    func clearLocalStorate(completion: @escaping (()->Void)) {
        do {
            try RealmStorage.shared.deleteAll()
            completion()
        } catch (let error) {
            debugPrint("Error in clearLocalStorate: ", error.localizedDescription)
        }
    }
}
