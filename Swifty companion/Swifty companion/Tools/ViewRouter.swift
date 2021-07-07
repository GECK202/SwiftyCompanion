//
//  ViewRouter.swift
//  Swifty companion
//
//  Created by Valeria Karon on 7/7/21.
//  Copyright © 2021 Valeria Karon. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {

    private var api = Connection()
    
    private var detail = LoadDetail()
    
    var student:Student
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()

    var currentPage: String = "searchView" {
        didSet {
            withAnimation() {
                objectWillChange.send(self)
            }
        }
    }
    
    @Published var nickName: String = ""
}
