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
    @State private var isLoading = false
    
    //圆形进度条
    @State private var progress: CGFloat = 0.0
    
    @State private var recordBegin = false
    @State private var recording = false
    
    var body: some View {
        
        ScrollView {
            VStack {
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
                
                //使用RotationEffect建立下载指示器
                Circle()
                    .trim(from: 0, to: 0.7)
                    .stroke(.green, lineWidth: 15)
                    .frame(width:200, height:200)
                    .padding(.top,50)
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                    .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
                    .onAppear() {
                        isLoading = true
                    }
                
                ZStack {
                    Circle()
                        .stroke(Color(.systemGray5), lineWidth: 20)
                        .frame(width: 200, height: 200)
                    Circle()
                        .trim(from: 0, to: 0.2)
                        .stroke(Color.green, lineWidth: 14)
                        .frame(width: 200, height: 200)
                        .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                        .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
                        .onAppear() {
                            self.isLoading = true
                        }
                }
                
                ZStack {
                    Text("Loading")
                        .font(.system(.body, design: .rounded))
                        .bold()
                        .offset(x: 0, y: 15)
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color(.systemGray5), lineWidth: 3)
                        .frame(width: 250, height: 3)
                    
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.green, lineWidth: 3)
                        .frame(width: 30, height: 3)
                        .offset(x: isLoading ? 110 : -110, y: 0)
                        .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
                }.padding(.bottom, 50)
                    .onAppear() {
                        self.isLoading = true
                    }
                
                //圆形进度条
                ZStack {
                    Text("\(Int(progress * 100))%")
                        .font(.system(.title, design: .rounded))
                        .bold()
                    Circle()
                    .stroke(Color(.systemGray5), lineWidth: 10)
                    .frame(width: 150, height: 150)
                    
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(Color.green, lineWidth: 10)
                        .frame(width: 150, height: 150)
                        .rotationEffect(Angle(degrees: -90))
                    }
                    .onAppear() {
                            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                            self.progress += 0.05
                            print(self.progress)
                            if self.progress >= 1.0 {
                                timer.invalidate()
                            }
                        }
                    }.padding(.bottom, 60)
                
                
                
                HStack {
                    ForEach(0...4, id: \.self) { index in
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.green)
                            .scaleEffect(self.isLoading ? 0 : 1)
                            .animation(.linear(duration: 0.6).repeatForever().delay(0.2 * Double(index)), value: isLoading)
                        }
                    }
                    .onAppear() {
                        self.isLoading = true
                    }
                    .padding(.bottom, 60)
                    
                
                //语音按钮转圆形按钮
                ZStack {
                    RoundedRectangle(cornerRadius: recordBegin ? 30 : 5)
                        .frame(width: recordBegin ? 60 : 250, height: 60)
                        .foregroundColor(recordBegin ? .red : .green)
                        .overlay(
                            Image(systemName: "mic.fill")
                                .font(.system(.title))
                                .foregroundColor(.white)
                                .scaleEffect(recording ? 0.7 : 1)
                        )
                    
                    RoundedRectangle(cornerRadius: recordBegin ? 35 : 10)
                        .trim(from: 0, to: recordBegin ? 0.0001 : 1)
                        .stroke(lineWidth: 5)
                        .frame(width: recordBegin ? 70 : 260, height: 70)
                        .foregroundColor(.green)
                }
                .onTapGesture {
                    withAnimation(Animation.spring()) {
                        self.recordBegin.toggle()
                    }
                    withAnimation(Animation.spring().repeatForever().delay(0.5)) {
                        self.recording.toggle()
                    }
                }
                
            }
        }
      
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
