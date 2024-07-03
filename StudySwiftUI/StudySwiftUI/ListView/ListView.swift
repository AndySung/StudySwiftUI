//
//  ListView.swift
//  StudySwiftUI
//
//  Created by andy on 2024/5/24.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack {
            /*List {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
                Text("Item 4")
            }
            
            List {
                ForEach(1...4, id: \.self) { index in
                    Text("Item \(index)")
                }
            }
            
            List(1...4, id: \.self) {
                Text("Item \($0)")
            }*/
            
            ListImgView()
        }
        
        
    }
}

struct ListImgView: View {
//    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery","Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore","Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
//
//    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
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
//                        Restaurant(name: "Upstate", image: "upstate"),
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
                           
    var body: some View {
        /*List(restaurantNames.indices, id: \.self) { index in
            HStack {
                Image(self.restaurantImages[index])
                    .resizable()
                    .frame(width: 40, height:40)
                    .cornerRadius(5)
                Text(self.restaurantNames[index])
            }
        }*/
       /* List(restaurants) { restaurant in
//            BasicImageRow(restaurant: restaurant)//显示list形式的UI
            FullImageRow(restaurant: restaurant)//换一个格式显示UI
        }
        .listStyle(.plain)*/
        
        //上面两个显示为一种格式的UI，下面显示是列表的UI
        List {
            ForEach(restaurants.indices, id: \.self) { index in
                if (0...1).contains(index) {
                    FullImageRow(restaurant: self.restaurants[index])
                } else {
                    BasicImageRow(restaurant: self.restaurants[index])
                }
            }
            //.listRowSeparatorTint(.green) //修改分隔符颜色为绿色
            //.listRowSeparator(.hidden) //隐藏分割线
            .listRowSeparator(.hidden, edges: .bottom) //讓分隔線保持在列表視圖的頂部
        }
        //.background(.yellow) //用颜色更改可滚动区域的颜色
        .background {   //使⽤圖像作為背景使⽤圖像作為背景
            Image("homei")
            .resizable()
            .scaledToFill()
            .clipped()
            .ignoresSafeArea()
        }
        .scrollContentBackground(.hidden)
//        .listStyle(.plain)
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

struct BasicImageRow: View {
    var restaurant: Restaurant
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height:40)
                .cornerRadius(5)
            Text(restaurant.name)
            
            if restaurant.isCheckIn {
                  Image(systemName: "checkmark.seal.fill")
                      .foregroundColor(.red)
              }
              
              if restaurant.isFavorite {
                  Spacer()
                  
                  Image(systemName: "star.fill")
                      .foregroundColor(.yellow)
              }
        }
    }
}

struct FullImageRow: View {
    var restaurant: Restaurant
    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}
