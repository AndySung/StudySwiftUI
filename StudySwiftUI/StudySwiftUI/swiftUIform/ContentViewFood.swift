//
//  ContentViewFood.swift
//  StudySwiftUI
//
//  Created by andy on 2024/6/16.
//

import SwiftUI

struct ContentViewFood: View {
    @State public var showSettings: Bool
    
    @State var foodRestaurants = [
        FoodRestaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", phone: "232-923423", image: "cafedeadend", priceLevel: 3),
        FoodRestaurant(name: "Homei", type: "Cafe", phone: "348-233423", image: "homei", priceLevel: 3),
        FoodRestaurant(name: "Teakha", type: "Tea House", phone: "354-243523", image: "teakha", priceLevel: 3, isFavorite: true, isCheckIn: true),
        FoodRestaurant(name: "Cafe loisl", type: "Austrian / Casual Drink", phone: "453-333423", image: "cafeloisl", priceLevel: 2, isFavorite: true, isCheckIn: true),
        FoodRestaurant(name: "Petite Oyster", type: "French", phone: "983-284334", image: "petiteoyster", priceLevel: 5, isCheckIn: true),
        FoodRestaurant(name: "For Kee Restaurant", type: "Hong Kong", phone: "232-434222", image: "forkeerestaurant", priceLevel: 2, isFavorite: true, isCheckIn: true),
        FoodRestaurant(name: "Po's Atelier", type: "Bakery", phone: "234-834322", image: "posatelier", priceLevel: 4),
        FoodRestaurant(name: "Bourke Street Backery", type: "Chocolate", phone: "982-434343", image: "bourkestreetbakery", priceLevel: 4, isCheckIn: true),
        FoodRestaurant(name: "Haigh's Chocolate", type: "Cafe", phone: "734-232323", image: "haighschocolate", priceLevel: 3, isFavorite: true),
        FoodRestaurant(name: "Palomino Espresso", type: "American / Seafood", phone: "872-734343", image: "palominoespresso", priceLevel: 2),
        FoodRestaurant(name: "Upstate", type: "Seafood", phone: "343-233221", image: "upstate", priceLevel: 4),
        FoodRestaurant(name: "Traif", type: "American", phone: "985-723623", image: "traif", priceLevel: 5),
        FoodRestaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", phone: "455-232345", image: "grahamavenuemeats", priceLevel: 3),
        FoodRestaurant(name: "Waffle & Wolf", type: "Coffee & Tea", phone: "434-232322", image: "wafflewolf", priceLevel: 3),
        FoodRestaurant(name: "Five Leaves", type: "Bistro", phone: "343-234553", image: "fiveleaves", priceLevel: 4, isFavorite: true, isCheckIn: true),
        FoodRestaurant(name: "Cafe Lore", type: "Latin American", phone: "342-455433", image: "cafelore", priceLevel: 2, isFavorite: true, isCheckIn: true),
        FoodRestaurant(name: "Confessional", type: "Spanish", phone: "643-332323", image: "confessional", priceLevel: 4),
        FoodRestaurant(name: "Barrafina", type: "Spanish", phone: "542-343434", image: "barrafina", priceLevel: 2, isCheckIn: true),
        FoodRestaurant(name: "Donostia", type: "Spanish", phone: "722-232323", image: "donostia", priceLevel: 1),
        FoodRestaurant(name: "Royal Oak", type: "British", phone: "343-988834", image: "royaloak", priceLevel: 2, isFavorite: true),
        FoodRestaurant(name: "CASK Pub and Kitchen", type: "Thai", phone: "432-344050", image: "caskpubkitchen", priceLevel: 1)
        ]
    

    @State private var selectedRestaurant: FoodRestaurant?
 //   var settingStore: SettingStore
     @EnvironmentObject var settingStore: SettingStore

    
    var body: some View {
        NavigationStack {
            List {
                ForEach(foodRestaurants.sorted(by: self.settingStore.displayOrder.predicate())) { foodRestaurant in
                    BasicFoodImageRow(restaurantFood: foodRestaurant)
                        .contextMenu {
                            
                            Button(action: {
                                // mark the selected restaurant as check-in
                                self.checkIn(item: foodRestaurant)
                            }) {
                                HStack {
                                    Text("Check-in")
                                    Image(systemName: "checkmark.seal.fill")
                                }
                            }
                            
                            Button(action: {
                                // delete the selected restaurant
                                self.delete(item: foodRestaurant)
                            }) {
                                HStack {
                                    Text("Delete")
                                    Image(systemName: "trash")
                                }
                            }
                                             
                            Button(action: {
                                // mark the selected restaurant as favorite
                                self.setFavorite(item: foodRestaurant)
                                
                            }) {
                                HStack {
                                    Text("Favorite")
                                    Image(systemName: "star")
                                }
                            }
                        }
                        .onTapGesture {
                            self.selectedRestaurant = foodRestaurant
                        }
                }
                .onDelete { (indexSet) in
                    self.foodRestaurants.remove(atOffsets: indexSet)
                }
            }
            
            .navigationTitle("Restaurant")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.showSettings = true
                    } label: {
                        Image(systemName: "gear").font(.title2)
                    }.tint(.black)
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingView().environmentObject(self.settingStore)
            }
            
        }
//        .onAppear {
//            self.selectedOrder = self.settingStore.displayOrder
//            self.showCheckInOnly = self.settingStore.showCheckInOnly
//            self.maxPriceLevel = self.settingStore.maxPriceLevel
//        }
        
       
    }
    
    private func delete(item restaurant: FoodRestaurant) {
        if let index = self.foodRestaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.foodRestaurants.remove(at: index)
        }
    }
    
    private func setFavorite(item restaurant: FoodRestaurant) {
        if let index = self.foodRestaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.foodRestaurants[index].isFavorite.toggle()
        }
    }
    
    private func checkIn(item restaurant: FoodRestaurant) {
        if let index = self.foodRestaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.foodRestaurants[index].isCheckIn.toggle()
        }
    }
}

struct FoodRestaurant: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var phone: String
    var image: String
    var priceLevel: Int
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}

struct BasicFoodImageRow: View {
    var restaurantFood: FoodRestaurant
    
    var body: some View {
      
            HStack {
                Image(restaurantFood.image)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(restaurantFood.name)
                            .font(.system(.body, design: .rounded))
                            .bold()
                        
                        Text(String(repeating: "$", count: restaurantFood.priceLevel))
                            .font(.subheadline)
                            .foregroundColor(.gray)

                    }
                    
                    Text(restaurantFood.type)
                        .font(.system(.subheadline, design: .rounded))
                        .bold()
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                    
                    Text(restaurantFood.phone)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                    .layoutPriority(-100)
                
                if restaurantFood.isCheckIn {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.red)
                }
                
                if restaurantFood.isFavorite {
//                    Spacer()
                    
                    Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                }
            }
            
        
    }
}


struct ContentViewFood_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewFood(showSettings: false).environmentObject(SettingStore())
    }
}
