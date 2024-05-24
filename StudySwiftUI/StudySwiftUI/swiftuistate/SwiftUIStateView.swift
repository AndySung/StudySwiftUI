//
//  SwiftUIStateView.swift
//  StudySwiftUI
//
//  Created by andy on 2024/5/22.
//

import SwiftUI

struct SwiftUIStateView: View {
//    @State private var isPlaying = false
    @State var redInt: Int
    @State var greenInt: Int
    @State var blueInt: Int
    var body: some View {
//        ScrollView{
//            VStack {
//                Button{
//                    isPlaying.toggle()
//                }label: {
//                    Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
//                        .font(.system(size: 150))
//                        .foregroundColor(isPlaying ? .red : .green)
//                }
//
//                Button{
//                    counter += 1
//                }label: {
//                    Circle()
//                        .frame(width: 200,height: 200)
//                        .foregroundStyle(.red)
//                        .overlay {
//                            Text("\(counter)")
//                                .font(.system(size: 100, weight: .bold, design: .rounded))
//                                .foregroundColor(.white)
//                        }
//                }
//            }
//
//            CounterButton(counter: $counter, color: .red)
//            CounterButton(counter: $counter, color: .blue)
//            CounterButton(counter: $counter, color: .green)
//        }
        VStack {
            Text("\(redInt+greenInt+blueInt)")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .lineLimit(1)
                .font(.system(size: 200, weight: .bold, design: .rounded))
            HStack {
                CounterBtn(intoal: $redInt, color: .red)
                CounterBtn(intoal: $greenInt, color: .green)
                CounterBtn(intoal: $blueInt, color: .yellow)
                
            }
        }
    }
}





struct CounterButton: View {
    @Binding var counter: Int
    var color: Color
    var body: some View {
        Button {
            counter += 1
        }label: {
            Circle()
                .frame(width: 200,height: 200)
                .foregroundStyle(color)
                .overlay(
                    Text("\(counter)")
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                )
        }
    }
}

struct SwiftUIStateView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStateView(redInt: 0, greenInt: 0, blueInt: 0)
    }
}

struct CounterBtn: View {
    @Binding var intoal: Int
    var color: Color
    var body: some View {
        Button {
            intoal += 1
        } label: {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundStyle(color)
                .overlay(
                    Text("\(intoal)")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .lineLimit(1)
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                )
                .padding(.horizontal, 10)
        }
    }
}
