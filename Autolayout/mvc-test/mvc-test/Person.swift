//
//  File.swift
//  mvc-test
//
//  Created by Thanh on 12/5/16.
//  Copyright © 2016 Thanh. All rights reserved.
//

import Foundation

class Person {
    private var _firstName: String!
    private var _lastName: String!
    
    var firstName: String {
        get {
            return _firstName
        } set {
            _firstName = newValue
        }
    }
    
    var lastName: String {
        return _lastName
    }
    
    var fullName: String {
        return _firstName + " " + _lastName
    }
    
    init(firstName: String, lastName: String) {
        _firstName = firstName
        _lastName = lastName
    }

}
