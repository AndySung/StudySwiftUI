//
//  content.swift
//  StudySwiftUI
//
//  Created by andy on 2024/6/14.
//

import SwiftUI

struct content: View {
    var body: some View {
        NavigationStack {
            List(articles) { article in
                ZStack {
                    ArticleRow(article: article)
                    
                    NavigationLink(destination: ArticleDetailsView(article: article)) {
                        EmptyView()
                    }
                    .opacity(0)
                     
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            
            .navigationTitle("Your Reading")
        }
    }
}

struct content_Previews: PreviewProvider {
    static var previews: some View {
        content()
    }
}

struct ArticleRow: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
            
            Text(article.title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
                .padding(.bottom, 0)
            
            Text("By \(article.author)".uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 0)
            
            HStack(spacing: 3) {
                ForEach(1...(article.rating), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
            }
            
            Text(article.excerpt)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
        }
    }
}
