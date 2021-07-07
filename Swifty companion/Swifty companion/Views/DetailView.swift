//
//  DetailView.swift
//  Swifty companion
//
//  Created by Valeria Karon on 6/29/21.
//  Copyright © 2021 Valeria Karon. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            Text("NickName: \(self.viewRouter.nickName)")
            Button(action: {self.viewRouter.currentPage = "searchView"}) {
                Text("Back")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
