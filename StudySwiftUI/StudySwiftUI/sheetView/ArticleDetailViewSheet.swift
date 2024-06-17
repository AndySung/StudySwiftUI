//
//  ArticleDetailView.swift
//  SwiftUIModal
//
//  Created by Simon Ng on 11/7/2023.
//

import SwiftUI

struct ArticleDetailViewSheet: View {
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false


    var article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                        
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }.overlay(
                HStack {
                    Spacer()
                    VStack {
                        Button {
                            self.showAlert = true
                        } label: {
                            Image(systemName: "chevron.down.circle.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                        }
                        .padding(.trailing, 20)
                        .padding(.top, 40)
                        Spacer()
                    }
                }
            )
        }
        .ignoresSafeArea(.all, edges: .top)
        .alert("Reminder", isPresented: $showAlert, actions: {
            Button {
                dismiss()
            } label: {
                Text("Yes")
            }
            Button(role: .cancel, action: {}){
                Text("No")
            }
        }, message: {
            Text("Are you sure you are finished reading the article ?")
        })
    }
}

//#Preview {
//    ArticleDetailView(article: articles[0])
//}
