//
//  AnimationView.swift
//  StudySwiftUI
//
//  Created by andy on 2024/5/24.
//

import SwiftUI

struct AnimationView: View {
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
            }
        //这些是隐式动画
//        .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3), value: circleColorChanged)
//            //.animation(.default, value: circleColorChanged)
//            .animation(.default, value: heartSizeChanged)
//            .onTapGesture {
//                circleColorChanged.toggle()
//                heartColorChanged.toggle()
//                heartSizeChanged.toggle()
//            }
        //这里是显示动画
//        .onTapGesture {
//            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
//                self.circleColorChanged.toggle()
//                self.heartColorChanged.toggle()
//                self.heartSizeChanged.toggle()
//            }
//        }
        //另一种写法
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
                self.circleColorChanged.toggle()
                self.heartColorChanged.toggle()
            }
            self.heartSizeChanged.toggle()
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
