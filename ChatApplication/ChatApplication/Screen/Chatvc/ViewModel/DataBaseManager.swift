//
//  DataBaseManager.swift
//  ChatApplication
//
//  Created by neosoft on 26/03/24.
//

import Foundation
import FirebaseDatabase
//
//final class DataBaseManager
//{
//    static let shared = DataBaseManager()
//    let database = Database.database().reference()
//}
//
//extension DataBaseManager
//{
//    public func userExists(with person1 : String,Completion: @escaping((Bool)->Void))
//    {
//         database.child(person1).observeSingleEvent(of: .value ,with : { DataSnapshot in
//            guard DataSnapshot.value as? String != nil else{
//                Completion(false)
//                return
//            }
//            Completion(true)
//        })
//    }
//
//    public func insertUser(with user : ChatAppUser)
//     {
//        database.child(user.firstName).setValue([
//            "firstName" : user.firstName,
//            "lastName": user.lastName,
//            "emailAdress": user.emailAdress
//            ])
//    }
//}



// change according to Hitesh sir
protocol DataBaseManagerDelegate: AnyObject {
    func userExistsResult(_ exists: Bool)
}

final class DataBaseManager {
    static let shared = DataBaseManager()
    let database = Database.database().reference()
    weak var delegate: DataBaseManagerDelegate?

    public func userExists(with person1: String) {
        database.child(person1).observeSingleEvent(of: .value) { dataSnapshot in
            guard dataSnapshot.value as? String != nil else {
                self.delegate?.userExistsResult(false)
                return
            }
            self.delegate?.userExistsResult(true)
        }
    }

    public func insertUser(with user: ChatAppUser) {
        database.child(user.firstName).setValue([
            "firstName": user.firstName,
            "lastName": user.lastName,
            "emailAdress": user.emailAdress
        ])
    }
}



