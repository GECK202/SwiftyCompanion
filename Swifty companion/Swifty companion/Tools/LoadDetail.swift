//
//  LoadDetail.swift
//  Swifty companion
//
//  Created by Valeria Karon on 7/7/21.
//  Copyright © 2021 Valeria Karon. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import Alamofire
import SwiftyJSON

class LoadDetail: ObservableObject {
    
    let objectWillChange = PassthroughSubject<LoadDetail,Never>()

    var result: Int = 0 {
        didSet {
            withAnimation() {
                objectWillChange.send(self)
            }
        }
    }
    
    @Published var student = Student()
    
    func getDetail(nickName: String, token: String) {
        self.result = 0
        self.student = Student()
        guard let userUrl = URL(string: "https://api.intra.42.fr/v2/users/" + nickName.lowercased()) else { self.result = -1; return }
        var request = URLRequest(url: userUrl)
        let value = "Bearer \(token)"
        request.httpMethod = "GET"
        request.setValue(value, forHTTPHeaderField: "Authorization")
        AF.request(request as URLRequestConvertible).validate().responseJSON {
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let phone = json["phone"].string {
                    self.student.phone = phone
                    print(phone)
                }
                if let walet = json["wallet"].int {
                    self.student.wallet = walet
                    print(walet)
                }
                if let displayname = json["displayname"].string {
                    self.student.displayname = displayname
                    print(displayname)
                }
                if let email = json["email"].string {
                    self.student.email = email
                    print(email)
                }
                if let image_url = json["image_url"].string {
                    self.student.image_url = image_url
                    print(image_url)
                }
                if let location = json["location"].string {
                    self.student.location = location
                    print(location)
                }
                if let login = json["login"].string {
                    self.student.nickName = login
                    print(login)
                }
                if let pool_year = json["pool_year"].string {
                    self.student.pool_year = pool_year
                    print(pool_year)
                }
                if let pool_month = json["pool_month"].string {
                    self.student.pool_month = pool_month
                    print(pool_month)
                }
                if let correction_point = json["correction_point"].int {
                    self.student.correction_point = correction_point
                    print(correction_point)
                }
                if let level = json["cursus_users"][0]["level"].double {
                    self.student.level = level
                    print(level)
                }
                if let campus_country = json["campus"][0]["country"].string {
                    self.student.campus_country = campus_country
                    print(campus_country)
                }
                if let campus_cite = json["campus"][0]["city"].string {
                    self.student.campus_city = campus_cite
                    print(campus_cite)
                }
                if let skills = json["cursus_users"][0]["skills"].array {
                    for i in skills {
                        if let level = i["level"].float {
                            self.student.skills.append(Skill(name: i["name"].string!, val: level * 5.0))
                        }
                    }
                }
                
                if let projects_users = json["projects_users"].array {
                    for i in projects_users {
                        if i["final_mark"].int == nil {
                            self.student.projects.append(
                                Project( name: i["project"]["name"].string!,
                                         slug: i["project"]["slug"].string!,
                                         status: i["status"].string!,
                                         validated: i["validated?"].bool ?? false,
                                         finalMark: 0,
                                         statusProject: .loading))
                        } else {
                            if i["validated?"].bool! == true && i["final_mark"].int != nil && i["final_mark"].int! > 0 {
                                self.student.projects.append(
                                    Project( name: i["project"]["name"].string!,
                                             slug: i["project"]["slug"].string!,
                                             status: i["status"].string!,
                                             validated: i["validated?"].bool!,
                                             finalMark: i["final_mark"].int!,
                                             statusProject: .success))
                            } else if i["validated?"].bool! != true {
                                self.student.projects.append(
                                    Project( name: i["project"]["name"].string!,
                                             slug: i["project"]["slug"].string!,
                                             status: i["status"].string!,
                                             validated: i["validated?"].bool!,
                                             finalMark: i["final_mark"].int!,
                                             statusProject: .fail))
                            }
                        }
                    }
                }
                
                
                self.result = 1
            case .failure(let error):
                print(error)
                print(" FAILED ")
                self.result = -2
            }
        }
    }
}
