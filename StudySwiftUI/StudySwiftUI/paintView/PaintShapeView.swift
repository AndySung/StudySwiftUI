//
//  PaintView.swift
//  StudySwiftUI
//
//  Created by andy on 2024/5/24.
//

import SwiftUI

struct PaintShapeView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                zfxView()
                
                huxingView()
                
                //使用fill 和 stroke 绘制图
                diejiaView()

              
                //绘制圆弧圆饼
                yuanhuView()
                
                //圆饼
                yuanbingView()
                
                Path() { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addQuadCurve(to: CGPoint(x: 200, y: 0), control: CGPoint(x: 100, y: -20))
                    path.addRect(CGRect(x: 0, y: 0, width: 200, height: 40))
                }
                .fill(Color.green)
                
                Button(action: {
                // 執⾏動作
                }) {
                    Text("Test")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(Dome().fill(Color.red))
                }.padding(.top, 100)
                
                
                Circle()
                .foregroundColor(.green)
                .frame(width: 200, height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                ).padding(.bottom,60)
                
                
                circleJindutiaoView()
                
                ZStack {
                    Circle()
                        .trim(from: 0, to: 0.4)
                        .stroke(Color(.systemBlue), lineWidth: 80)
                    Circle()
                        .trim(from: 0.4, to: 0.6)
                        .stroke(Color(.systemTeal), lineWidth: 80)
                    Circle()
                        .trim(from: 0.6, to: 0.75)
                        .stroke(Color(.systemPurple), lineWidth: 80)
                    Circle()
                        .trim(from: 0.75, to: 1)
                        .stroke(Color(.systemYellow), lineWidth: 90)
                        .overlay(
                    Text("25%")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .offset(x: 80, y: -100)
                    )
                }
                .frame(width: 250, height: 250)
            }
        }
    }
}

struct Dome: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint(x: rect.size.width/2, y: -(rect.size.width * 0.1)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        return path
    }
}

struct PaintShapeView_Previews: PreviewProvider {
    static var previews: some View {
        PaintShapeView()
    }
}

struct zfxView: View {
    var body: some View {
        Path() { path in
            path.move(to: CGPoint(x: 20, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 200))
            path.addLine(to: CGPoint(x: 20, y: 200))
            //因為我們沒有指定將線條繪製到原點,所以图形不闭合
            //下面使用closeSubpath()封闭图形
            path.closeSubpath()
        }
        //        .fill(.green)
        .stroke(.red, lineWidth: 10)
        
    }
}

struct huxingView: View {
    var body: some View {
        Path() { path in
            path.move(to: CGPoint(x: 20, y: 60))
            path.addLine(to: CGPoint(x: 40, y: 60))
            path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
            path.addLine(to: CGPoint(x: 230, y: 60))
            path.addLine(to: CGPoint(x: 230, y: 100))
            path.addLine(to: CGPoint(x: 20, y: 100))
        }
        .fill(Color.purple)
        .padding(.bottom, 200)
    }
}

struct diejiaView: View {
    var body: some View {
        ZStack {
            Path() { path in
                path.move(to: CGPoint(x: 20, y: 60))
                path.addLine(to: CGPoint(x: 40, y: 60))
                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                path.addLine(to: CGPoint(x: 230, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 100))
                path.addLine(to: CGPoint(x: 20, y: 100))
            }
            .fill(Color.purple)
            
            Path() { path in
                path.move(to: CGPoint(x: 20, y: 60))
                path.addLine(to: CGPoint(x: 40, y: 60))
                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                path.addLine(to: CGPoint(x: 230, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 100))
                path.addLine(to: CGPoint(x: 20, y: 100))
                path.closeSubpath()
            }
            .stroke(Color.black, lineWidth: 5)
            .padding(.bottom, 100)
        }
    }
}

struct yuanhuView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 200))
            path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
            
        }
        .fill(.green)
        .padding(.bottom, 100)
    }
}

struct yuanbingView: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(0), endAngle: .degrees(190), clockwise: true)
            }
            .fill(.yellow)
            
            
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(190), endAngle: .degrees(110), clockwise: true)
            }
            .fill(.teal)
            
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(110), endAngle: .degrees(90), clockwise: true)
            }
            .fill(.blue)
            
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(90), endAngle: .degrees(360), clockwise: true)
            }
            .fill(.purple)
            .offset(x:20, y:20)
            .overlay(
                Text("25%")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .offset(x: 78,y: 270)
            )
        }
        .padding(.top, 200)
        .padding(.bottom, 400)
    }
}

struct circleJindutiaoView: View {
    private var purpleGradient = LinearGradient(gradient:Gradient(colors: [Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255,blue: 179/255) ]), startPoint: .trailing, endPoint: .leading)
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 20)
                .frame(width: 300, height: 300)
            
            Circle()
                .trim(from: 0, to: 0.85)
                .stroke(purpleGradient, lineWidth: 24)
                .frame(width: 300, height: 300)
                .overlay {
                    VStack {
                        Text("85%")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundColor(.gray)
                        Text("Complete")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(.gray)
                }
            }
        }.padding(.bottom, 80)
    }
}
