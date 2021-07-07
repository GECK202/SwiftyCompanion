//
//  ContentView.swift
//  Swifty companion
//
//  Created by Valeria Karon on 6/29/21.
//  Copyright © 2021 Valeria Karon. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack() {
            Spacer()
            TextField("Student nickname", text: $viewRouter.nickName)
                .padding()
                .background(Color.white)
                .padding()
            Button(action: {
                self.viewRouter.currentPage = "detailView"
            }){
                Text("Find")
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color(red: 0.5, green: 0.9, blue: 0.7))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
            Spacer()
            Spacer()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
