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
    @EnvironmentObject var detail: LoadDetail
    
    var body: some View {
        VStack {
            if detail.result == 0 {
                SearchView()
            } else if detail.result == 1 {
                DetailView()
                    .transition(.scale)
            } else {
                ErrorView()
                    .transition(.scale)
            }
        }.background(Image("background")).onAppear{ self.viewRouter.api.getToken()}
    }
}
