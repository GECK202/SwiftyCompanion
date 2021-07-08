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
    @EnvironmentObject var detail: LoadDetail
        
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 100.0) {
                Button(action: { self.detail.result = 0 }) {
                    HStack {
                        Image(systemName: "arrow.counterclockwise")
                        Text("Back").multilineTextAlignment(.leading)
                    }
                }
                Text("(\(self.detail.student.nickName))")
                .foregroundColor(.white)
            }.padding(.horizontal)
            VStack(alignment: .leading) {
                HStack {
                    ImageView(withURL: self.detail.student.image_url)
                        .clipShape(Circle())
                    VStack {
                        HStack {
                            Text("\(self.detail.student.displayname)")
                                .font(.largeTitle)
                            Spacer()
                        }
                        Text("Level: \(String(format: "%.2f", detail.student.level))")
                            .font(.title)
                            .foregroundColor(.yellow)
                        Text("Wallets: \(self.detail.student.wallet)")
                            .font(.subheadline)
                    }
                }
                VStack {
                    HStack{
                        Image(systemName: "phone")
                        Text("\(self.detail.student.phone)")
                        Spacer()
                        Image(systemName: "envelope")
                        Text("\(self.detail.student.email)")
                        Spacer()
                    }
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                        Text("\(self.detail.student.campus_country) - \(self.detail.student.campus_city)   \(self.detail.student.location)")
                        Spacer()
                    }
                }.padding(.horizontal)
                Divider()
                Text("Skills:").font(.title)
                ScrollView {
                    VStack {
                        ForEach (self.detail.student.skills) { skill in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(skill.name)")
                                    Spacer()
                                    Text("-\(String(format: "%2.0f", skill.val)) %")
                                }
                            }.padding(.horizontal)
                        }
                    }
                }.border(Color.white)
                Text("Projects:").font(.title)
                ScrollView {
                    VStack {
                        ForEach (self.detail.student.projects) { project in
                            VStack(alignment: .leading) {
                                HStack(spacing: 10) {
                                    Text("\(project.name)").frame(maxWidth: .infinity)
                                    Text("\(String(project.status))").frame(maxWidth: .infinity)
                                    Text("\(String(project.finalMark))").frame(maxWidth: .infinity)
                                }.foregroundColor(getProjectColor(project: project))
                                    .border(Color.white)
                            }.padding(.horizontal)
                        }
                    }
                }.border(Color.white)
            }.foregroundColor(.white)
            Spacer()
        }
    }
}

func getProjectColor(project: Project)->Color {
    if project.statusProject == .success {
        return Color.green
    } else if project.statusProject == .fail {
        return Color.red
    } else {
        return Color.white
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
