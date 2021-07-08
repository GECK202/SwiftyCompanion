//
//  Student.swift
//  Swifty companion
//
//  Created by Valeria Karon on 7/7/21.
//  Copyright © 2021 Valeria Karon. All rights reserved.
//

import Foundation

struct Skill: Identifiable {
    let id = UUID()
    let name: String
    let val: Float
}

struct Project: Identifiable {
    enum StatusProject:String {
        case success
        case loading
        case fail
    }
    let id = UUID()
    let name: String
    let slug: String
    let status: String
    let validated: Bool
    let finalMark: Int
    let statusProject: StatusProject
}

struct Student {
    var nickName = ""
    var phone = ""
    var wallet = 0
    var displayname = ""
    var image_url = ""
    var location = ""
    var pool_year = ""
    var pool_month = ""
    var campus_city = ""
    var campus_country = ""
    var correction_point = 0
    var level = 0.0
    var email = ""
    var skills = [Skill]()
    var projects = [Project]()
}
