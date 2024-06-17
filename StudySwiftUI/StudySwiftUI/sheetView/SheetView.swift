//
//  SheetView.swift
//  StudySwiftUI
//
//  Created by andy on 2024/6/15.
//

import SwiftUI

struct SheetView: View {
    @State var showDetailView = false
    @State var selectedArticle: Article?
    
    var body: some View {
        NavigationStack {
            List(articles) { article in
                ArticleRow(article: article)
                    .onTapGesture {
                        self.selectedArticle = article
                        self.showDetailView = true
                    }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .sheet(item: $selectedArticle, content: { article in
                ArticleDetailViewSheet(article: article)
            })
//            .sheet(isPresented: $showDetailView) {
//                if let selectedArticle = self.selectedArticle {
//                    ArticleDetailView(article: selectedArticle)
//                }
//            }
            .navigationTitle("Your Reading")
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
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
//
//
//            }
//
//            Text(article.excerpt)
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//
//        }
//    }
//}

