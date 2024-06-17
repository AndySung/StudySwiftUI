//
//  ArticleDetailView.swift
//  StudySwiftUI
//
//  Created by andy on 2024/6/2.
//

import SwiftUI

struct ArticleDetailView: View {
    var article: Article
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        /*ScrollView {
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
            }
        }*/
        
//        NavigationStack {
//            List(articles) { article in
//                NavigationLink(destination: ArticleDetailView(article: article)) {
//                    ArticleRow(article: article)
//                }
//                .listRowSeparator(.hidden)
//            }
//            .listStyle(.plain)
//            .navigationTitle("Your Reading")
//        }
        
        NavigationStack {
            List(articles) { article in
                ZStack {
                    ArticleRow(article: article)
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        
                     }
                    .opacity(0)
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Your Reading")
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(.all, edges: .top)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    // 導覽⾄前⼀個畫⾯
                    dismiss()
                }) {
                    Image(systemName: "chevron.left.circle.fill")
                    .font(.largeTitle)
                }
                .tint(.white)
            }
        }
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: articles[0])
            .navigationTitle("Article")
    }
}

//struct ArticleRow: View {
//    var article: Article
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 6) {
//            Image(article.image)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .cornerRadius(5)
//            
//            Text(article.title)
//                .font(.system(.title, design: .rounded))
//                .fontWeight(.black)
//                .lineLimit(3)
//                .padding(.bottom, 0)
//            
//            Text("By \(article.author)".uppercased())
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//                .padding(.bottom, 0)
//            
//            HStack(spacing: 3) {
//                ForEach(1...(article.rating), id: \.self) { _ in
//                    Image(systemName: "star.fill")
//                        .font(.caption)
//                        .foregroundColor(.yellow)
//                }
//            }
//            
//            Text(article.excerpt)
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//            
//        }
//    }
//}
