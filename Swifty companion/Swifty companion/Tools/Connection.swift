//
//  Api.swift
//  Swifty companion
//
//  Created by Valeria Karon on 7/7/21.
//  Copyright © 2021 Valeria Karon. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Connection{
    
    private var token = ""
    
    func getToken() {
        if token.isEmpty {
            let url = "https://api.intra.42.fr/oauth/token"
            let config = [
                "grant_type": "client_credentials",
                "client_id": "b27d81a2b7c31869c6ba68b4f18112800733d005fb23df8935119c730ad0368a",
                "client_secret": "ac3256a856da705a9fd55f9cbc9e7ed6902137a225a2c4426199671b108a0673"]
            let verify = UserDefaults.standard.object(forKey: "token")
            if verify == nil {
                AF.request(url, method: .post, parameters: config).validate().responseJSON {
                    response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        if let token = json["access_token"].string {
                            self.token = token
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }
            else {
            }
        }
    }
}
