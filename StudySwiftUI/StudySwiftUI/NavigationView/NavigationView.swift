//
//  NavigationView.swift
//  StudySwiftUI
//
//  Created by andy on 2024/6/2.
//

import SwiftUI

struct NavigationView: View {
    var restaurants = [ Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
                   Restaurant(name: "Homei", image: "homei"),
                   Restaurant(name: "Teakha", image: "teakha"),
                   Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
                   Restaurant(name: "Petite Oyster", image: "petiteoyster"),
                   Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
                   Restaurant(name: "Po's Atelier", image: "posatelier"),
                   Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
                   Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
                   Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
                   Restaurant(name: "Homei", image: "upstate"),
                   Restaurant(name: "Traif", image: "traif"),
                   Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
                   Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
                   Restaurant(name: "Five Leaves", image: "fiveleaves"),
                   Restaurant(name: "Cafe Lore", image: "cafelore"),
                   Restaurant(name: "Confessional", image: "confessional"),
                   Restaurant(name: "Barrafina", image: "barrafina"),
                   Restaurant(name: "Donostia", image: "donostia"),
                   Restaurant(name: "Royal Oak", image: "royaloak"),
                   Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.red, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.red, .font:
        UIFont(name: "ArialRoundedMTBold", size: 20)!]
        //自定义返回按钮
        navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
  
    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants) { restaurant in
                    NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                        BasicImageRow(restaurant: restaurant)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Restaurants")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(.black)  //定义返回按钮颜色
        
    }
}

struct RestaurantDetailView: View {
    @Environment(\.dismiss) var dismiss
// 如果需要支援iOS15以下设备使用.presentationMode   @Environment(\.presentationMode) var presentationMode  //使用 presentationMode.wrappedValue.dismiss() 呼叫

    
    var restaurant: Restaurant
    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Spacer()
        }
        .navigationBarBackButtonHidden(true) //隐藏返回按钮
        .toolbar {  //自定义返回按钮
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                        .foregroundColor(.black)
                }
            }
        }
        
        
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}

