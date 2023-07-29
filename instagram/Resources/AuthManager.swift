//
//  AuthManager.swift
//  instagram
//
//  Created by Mansoor K on 15/07/23.
//

import Foundation
import FirebaseAuth

public class AuthManagaer {
    static let shared = AuthManagaer()
    
    //MARK: - Public
    
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        /*
         - Check if username is available
         - Check if email is available
         - Create account
         - Insert account to database
         */
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username){ canCreate in
            if canCreate {
                /*
                 - Create account
                 - Insert account to database
                 */
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else{
                        completion(false)
                        return
                    }
                    //Insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                        }
                        else {
                            // Failed to insert user record
                            completion(false)
                        }
                    }
                }
            }
            else {
                // either username or email does not exist
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            //email log in
            Auth.auth().signIn(withEmail: email, password: password){ authResult, error in
                guard authResult != nil, error == nil else{
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        else if let username = username {
            // username log in
            print(username)
        }
        
    }
    
    ///Attempt to log out Firebase user
    public func logOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        }
        catch {
            print(error)
            completion(false)
            return
        }
    }
}
