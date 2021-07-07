//
//  LoadDetail.swift
//  Swifty companion
//
//  Created by Valeria Karon on 7/7/21.
//  Copyright © 2021 Valeria Karon. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LoadDetail {
    
    var student = Student()
    
    func getDetail(nickName: String, token: String) {
        print(nickName)
        guard let userUrl = URL(string: "https://api.intra.42.fr/v2/users/" + nickName) else { return }
        var request = URLRequest(url: userUrl)
        request.httpMethod = "GET"
        request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        AF.request(request as URLRequestConvertible).validate().responseJSON {
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.student.phone = ""
                if let phone = json["phone"].string {
                    self.student.phone = phone
                    print(phone)
                }
                self.student.wallet = 0
                if let walet = json["wallet"].int {
                    self.student.wallet = walet
                    print(walet)
                }
                self.student.displayname = ""
                if let displayname = json["displayname"].string {
                    self.student.displayname = displayname
                    print(displayname)
                }
                self.student.email = ""
                if let email = json["email"].string {
                    self.student.email = email
                    print(email)
                }
                self.student.image_url = ""
                if let image_url = json["image_url"].string {
                    self.student.image_url = image_url
                    print(image_url)
                }
                self.student.location = ""
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
                self.student.correction_point = 0
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
            case .failure(let error):
                print(error)
                print(" FAILED ")
            }
        }
    }
}
