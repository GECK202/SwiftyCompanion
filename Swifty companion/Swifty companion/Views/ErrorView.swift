//
//  ErrorView.swift
//  Swifty companion
//
//  Created by Valeria Karon on 7/8/21.
//  Copyright © 2021 Valeria Karon. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var detail: LoadDetail
    
    var body: some View {
        VStack() {
            Spacer()
            Text("Error! User not found!")
                .font(.title)
                .foregroundColor(.white)
                .padding()
            HStack {
                Spacer()
                Button(action: { self.detail.result = 0 }){
                    Text("Back")
                        .foregroundColor(.black)
                }
                Spacer()
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

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
