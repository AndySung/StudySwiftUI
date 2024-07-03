//
//  gestureView.swift
//  StudySwiftUI
//
//  Created by andy on 2024/7/3.
//

import SwiftUI

enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}

struct gestureView: View {
    @State private var isPressed = false
    //@GestureState的优点是当手势结束时，它会自动将手势状态属性的值设定为初始值，这里是false
    @GestureState private var longPressTap = false  //长按手势
    @GestureState private var dragOffset = CGSize.zero  //拖拽手势
    @State private var position = CGSize.zero
    @GestureState private var dragState = DragState.inactive
    
    var body: some View {
       /* Image(systemName: "star.circle.fill")
            .font(.system(size: 200))
            .opacity(longPressTap ? 0.4 : 1.0)
            .scaleEffect(isPressed ? 0.5 : 1.0)
            .animation(.easeInOut, value: isPressed)
            .foregroundColor(.green)
            .gesture(
                /*TapGesture()        //短按手势
                    .onEnded({
                        self.isPressed.toggle()
                    })*/
                /*LongPressGesture(minimumDuration: 1.0)  //长按手势
                //currentState: Version:0.9 StartHTML:00000097 EndHTML:00001702 StartFragment:00001105 EndFragment:00001664 參數是⼿勢的⽬ 前狀態。 這個值會依照⼿勢⽽有所不同， 但對於長按⼿勢， true 值表⽰偵測到點擊事件。
                //state: Version:0.9 StartHTML:00000097 EndHTML:00002180 StartFragment:00001228 EndFragment:00002142 參數實際上是⼀個 in-out參數， 可以讓你更新 longPressTap 屬性的值。 在上列的程式碼中， 我們設定 state 的值為 currentState 。 換句話說， longPressTap屬性始終追蹤長按⼿勢的最新狀態
                //transaction: 参数储存了目前状态处理更新的内容
                    .updating($longPressTap, body: { (currentState, state, transaction) in
                        state = currentState
                    })
                    .onEnded({ _ in
                        self.isPressed.toggle()
                    })*/
            )*/
        
        /*Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
            .animation(.easeInOut, value: dragOffset)
            .foregroundColor(.green)
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { (value, state, transaction) in
                        state = value.translation
                    })
                //onEnded方法手势结束时调用
                    .onEnded({ (value) in
                        self.position.height += value.translation.height
                        self.position.width += value.translation.width
                    })
            )*/
        
        //多手势结合
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(x: position.width + dragState.translation.width, y: position.height + dragState.translation.height)
            .animation(.easeInOut, value: dragState.translation)
            .foregroundColor(.green)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                .sequenced(before: DragGesture())
                .updating($dragState, body: { (value, state, transaction) in
                    
                    switch value {
                    case .first(true):
                        state = .pressing
                    case .second(true, let drag):
                        state = .dragging(translation: drag?.translation ?? .zero)
                    default:
                        break
                    }
                    
                })
                .onEnded({ (value) in
                    
                    guard case .second(true, let drag?) = value else {
                        return
                    }
                    
                    self.position.height += drag.translation.height
                    self.position.width += drag.translation.width
                })
            )
    }
}

struct gestureView_Previews: PreviewProvider {
    static var previews: some View {
        gestureView()
    }
}
