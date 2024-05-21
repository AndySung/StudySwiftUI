//
//  ContentView.swift
//  StudySwiftUI
//
//  Created by andy on 2024/5/20.
//

import SwiftUI

struct TextView: View {
    @State private var colorChange = false
    @State private var sizeChange = false
    @State private var isOn = false
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .font(.system(size: 200))
                .foregroundColor(colorChange ? .yellow : .red)
                .scaleEffect(sizeChange ? 1.5: 1)
                .animation(.default, value: colorChange)
                .animation(.easeInOut, value: sizeChange)
                .onTapGesture {
                    colorChange.toggle()
                }
                .onLongPressGesture {
                    sizeChange.toggle()
                }
            Text("hello,my name is 女高中生叶野真生（深田恭子饰）得到一张演唱会门票，期待一睹著名音乐制作人石川启吾（金城武饰）的风采，岂料遇到一名变态的男子而丢失，结果不惜援助交际，以赚取购买门票的费用。演唱会结束后回程时，真生遇到启吾乘坐的车子，于是拉起横额表达对他的热爱，启吾见到后就带真生回到自己的住所。虽然他们开始交往，但真生却因为先前的援交而感染了艾滋病。启吾从真生绝望的表情，想起他死去的女友…")
                .lineLimit(nil)
                .lineSpacing(10)
                //.rotationEffect(.degrees(45))//旋转45度
                //.rotationEffect(.degrees(45), anchor: UnitPoint(x:0, y:0))//旋转45度
                .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                .truncationMode(.head)
                .shadow(color: .red, radius: 2, x:0, y:15)
            .padding()
        }
        
        .padding()
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
