//
//  RealmTests.swift
//  TaskAssignmentMainTests
//
//  Created by Mai Hassen on 02/05/2024.
//

import XCTest
@testable import TaskAssignmentMain
import RealmSwift

class TestObject: Object {
    @objc dynamic var name = ""
}

final class RealmTests: XCTestCase {
    
    func testStorageOperation() throws {
        let list = List<TestObject>()
        let testObject = TestObject()
        testObject.name = "Engineering University"
        list.append(testObject)
        try RealmStorage.shared.storeObjects(list)
    }
    
    func testReadOperation() throws {
        try testStorageOperation()
        
        let retrivedObject = try RealmStorage.shared.getObjectsFromDB(TestObject.self)
        let name = (retrivedObject.first as? TestObject)?.name ?? ""
        XCTAssertEqual(name, "Engineering University")
    }
    
    func testDeleteOperation() throws {
        try testStorageOperation()
        
        try RealmStorage.shared.deleteAll()
        
        let retrivedObject = try RealmStorage.shared.getObjectsFromDB(TestObject.self)
        let count = retrivedObject.count
        
        XCTAssertEqual(count, 0)
    }

}
