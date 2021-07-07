//
//  BaseView.swift
//  Swifty companion
//
//  Created by Valeria Karon on 7/7/21.
//  Copyright © 2021 Valeria Karon. All rights reserved.
//

import SwiftUI

struct BaseView : View {

    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "searchView" {
                SearchView()
            } else if viewRouter.currentPage == "detailView" {
                DetailView()
                    .transition(.scale)
            }
        }.background(Image("background")).onAppear{ self.viewRouter.api.getToken()}
    }
}
