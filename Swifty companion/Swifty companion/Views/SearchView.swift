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
    @EnvironmentObject var detail: LoadDetail
    @State var error = false
    
    var body: some View {
        VStack() {
            Spacer()
            TextField("Student nickname", text: $viewRouter.nickName)
                .padding()
                .background(Color.white)
                .foregroundColor(.black)
                .clipShape(RoundedRectangle(cornerRadius: CGFloat(20)))
                .padding()
            HStack {
                Button(action: {
                    self.detail.getDetail(nickName: self.viewRouter.nickName, token: self.viewRouter.api.token)
                }){
                    HStack {
                        Spacer()
                        Text("Find")
                            .foregroundColor(.black)
                        Spacer()
                    }
                }
            }
            .padding()
            .background(Color(red: 0.5, green: 0.9, blue: 0.7))
            .clipShape(RoundedRectangle(cornerRadius: CGFloat(20)))
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
