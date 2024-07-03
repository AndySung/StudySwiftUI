//
//  BasicBottomSheet.swift
//  StudySwiftUI
//  18章节 ： 利用presentation detents建立展开式底部表
//  Created by andy on 2024/7/3.
//

import SwiftUI

struct BasicBottomSheet: View {
    @State private var selectedRestaurant: Restaurant?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants) { restaurant in
                    BasicImageRow1(restaurant: restaurant)
                        .onTapGesture {
                            self.selectedRestaurant = restaurant
                        }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Restaurants")
        }
        .sheet(item: $selectedRestaurant) { restaurant in
            RestaurantDetailView1(restaurant: restaurant)
                .ignoresSafeArea()
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.hidden)
        }
    }
}

struct BasicBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BasicBottomSheet()
    }
}

struct BasicImageRow1: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}
