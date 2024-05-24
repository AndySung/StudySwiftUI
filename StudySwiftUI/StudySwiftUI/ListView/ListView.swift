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
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery","Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore","Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
                           
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
                           
    var body: some View {
        List(restaurantNames.indices, id: \.self) { index in
            HStack {
                Image(self.restaurantImages[index])
                    .resizable()
                    .frame(width: 40, height:40)
                    .cornerRadius(5)
                Text(self.restaurantNames[index])
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
