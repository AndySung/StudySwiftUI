//
//  studyButtonView.swift
//  StudySwiftUI
//
//  Created by andy on 2024/5/22.
//

import SwiftUI

struct studyButtonView: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack {
                Button {
                    print("hello world")
                }label: {
                    Text("Hello World")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(.purple, lineWidth: 5)
                        }
                }
                
                Button {
                    print("Delete button trpped!")
                } label: {
                    Image(systemName: "trash")
                        .padding()
                        .background(.red)
                        .clipShape(Circle())
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                
                Button {
                    print("Delete button tapped")
                } label: {
                    HStack {
                        Image(systemName: "trash")
                            .font(.title)
                        Text("Delete")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(40)
                }
                
                Button {
                    print("Delete button tapped")
                } label: {
                    Label(
                        title: {
                            Text("DDelete")
                                .fontWeight(.semibold)
                                .font(.title)
                        }, icon: {
                            Image(systemName: "trash")
                                .font(.title)
                        }
                    )
                    //想要全屏宽按钮要设置frame
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    //                .background(.red)
                    //                .background(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing))
                    .background(LinearGradient(gradient: Gradient(colors: [Color("buttonColor_dark_green"), Color("buttonColor_light_green")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .shadow(radius: 5.0)
                    .padding(.horizontal, 20)
                }
                
                
                Button{
                    print("Share button tapped")
                }label: {
                    Label(
                        title: {
                            Text("Share")
                                .fontWeight(.semibold)
                                .font(.title)
                        },
                        icon: {
                            Image(systemName: "square.and.arrow.up")
                                .font(.title)
                        }
                    )
                }
                .buttonStyle(GradientBackgroundStyle())
                
                
                Button{
                    print("Edit button tapped")
                }label: {
                    Label(
                        title: {
                            Text("Edit")
                                .fontWeight(.semibold)
                                .font(.title)
                        },
                        icon: {
                            Image(systemName: "square.and.pencil")
                                .font(.title)
                        }
                    )
                }.buttonStyle(GradientBackgroundStyle())
                
                
                Button{
                    print("Delete button tapped")
                }label: {
                    Label(
                        title: {
                            Text("Delete")
                                .fontWeight(.semibold)
                                .font(.title)
                        },
                        icon: {
                            Image(systemName: "trash")
                                .font(.title)
                        }
                    )
                }
                .buttonStyle(GradientBackgroundStyle())
                
                //ios15添加了按钮样式
                Button{
                    
                }label: {
                    Text("Buy me a coffee")
                }
                .tint(.purple)
//                .buttonStyle(.borderedProminent)
//                .buttonBorderShape(.roundedRectangle(radius: 5))
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                
                Group{
                    Button(action: {}) {
                        Text("Add to Cart")
                            .font(.headline)
                    }
                    Button(action: {}) {
                        Text("Discover")
                            .font(.headline)
                            .frame(maxWidth: 300)
                    }
                    Button(action: {}) {
                        Text("Checkout")
                            .font(.headline)
                    }
                }
                .tint(.purple)
                .buttonStyle(.bordered)
                .controlSize(.large)
                
                Group{
                    Button("Delete", role: .destructive) {
                        print("delete")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    
                    //                Button("Delete", role: .destructive) {
                    //                    print("delete")
                    //                }
                    //                .buttonStyle(.bordered)
                    //                .controlSize(.large)
                    
                    Button("Cancel", role: .cancel) {
                        print("cancel")
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                }

            }
        }
    }
        
}

struct studyButtonView_Previews: PreviewProvider {
    static var previews: some View {
        studyButtonView()
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("buttonColor_dark_green"), Color("buttonColor_light_green")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            
    }
}
