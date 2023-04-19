//
//  FinishView.swift
//  LittleBigTime
//
//  Created by Sebin Kwon on 2023/04/09.
//

import SwiftUI

struct FinishView: View {
    @EnvironmentObject var todolist: TodoList
    @Binding var rootIsActive: Bool
    @Binding var needsUpdate: Bool
    @State var isFirst = false
    @State var isSecond = false
    @State var isCircle = false
    @State var isOpacity = true
    
    var body: some View {
        //            ForEach(todolist.todoItems, id: \.self) {
        //                todoitem in
        //                Text("\(todoitem.todo),\(todoitem.time)")
        //                    .font(.custom("HelveticaNeue", size: 100))
        //                    .fontWeight(.ultraLight)
        //            }
        ZStack {
            Circle()
                .stroke(Color.blue, lineWidth: 2)
                .frame(width: 1500, height: 1500)
                .scaleEffect(isCircle ? 1 : 0)
                .opacity(isOpacity ? 1 : 0)
                .animation(.easeInOut(duration: 1.8), value: isCircle)
                .animation(.easeInOut(duration: 1), value: isOpacity)
            
            VStack {
                Text("Perfect!")
                    .tracking(2)
                    .font(.custom("HelveticaNeue", size: 100))
                    .fontWeight(.ultraLight)
                    .padding(.bottom)
                    .onTapGesture {
                        rootIsActive = false
                        needsUpdate = true
                    }
                    .opacity(isFirst ? 1 : 0)
                    .animation(Animation.easeInOut(duration: 1), value: isFirst)
                
                switch todolist.todoItems.count {
                case 1 :
                    Text("The seed has grown!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 50))
                        .fontWeight(.ultraLight)
                        .onTapGesture {
                            rootIsActive = false
                            needsUpdate = true
                        }
                        .opacity(isFirst ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1), value: isFirst)
                case 2:
                    Text("The sprout has grown!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 50))
                        .fontWeight(.ultraLight)
                        .onTapGesture {
                            rootIsActive = false
                            needsUpdate = true
                        }
                        .opacity(isFirst ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1), value: isFirst)
                case 3:
                    Text("The sprout has grown!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 50))
                        .fontWeight(.ultraLight)
                        .onTapGesture {
                            rootIsActive = false
                            needsUpdate = true
                        }
                        .opacity(isFirst ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1), value: isFirst)
                case 4:
                    Text("The tree has grown!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 50))
                        .fontWeight(.ultraLight)
                        .onTapGesture {
                            rootIsActive = false
                            needsUpdate = true
                        }
                        .opacity(isFirst ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1), value: isFirst)
                case 5:
                    Text("The tree has blossomed!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 50))
                        .fontWeight(.ultraLight)
                        .onTapGesture {
                            rootIsActive = false
                            needsUpdate = true
                        }
                        .opacity(isFirst ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1), value: isFirst)
                case 6:
                    Text("The tree bore fruit!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 50))
                        .fontWeight(.ultraLight)
                        .onTapGesture {
                            rootIsActive = false
                            needsUpdate = true
                        }
                        .opacity(isFirst ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1), value: isFirst)
                default:
                    Text("You're doing great! Keep going!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 50))
                        .fontWeight(.ultraLight)
                        .onTapGesture {
                            rootIsActive = false
                            needsUpdate = true
                        }
                        .opacity(isFirst ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1), value: isFirst)
                }
                
            }
//            .offset(y:120)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    isFirst.toggle()
                    isCircle.toggle()
                    isOpacity.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isFirst.toggle()
                    isSecond.toggle()
                }
            }
            VStack {
                Text("Remember that the small moments, though they may seem insignificant\nare precious building blocks that shape our lives over time.")
                    .tracking(2)
                    .font(.custom("HelveticaNeue", size: 30))
                    .fontWeight(.ultraLight)
                    .multilineTextAlignment(.center)
                    .opacity(isSecond ? 1 : 0)
                    .animation(Animation.easeInOut(duration: 1).delay(2), value: isSecond)
                    .lineSpacing(6)
                    .padding(.bottom, 200)
                
                Button(action: {
                    rootIsActive = false
                    needsUpdate = true
                }) {
                    Text("Back to home")
                        .tracking(1)
                        .font(.custom("HelveticaNeue", size: 35))
                        .fontWeight(.light)
                        .padding(.horizontal, 60.0)
                        .padding(.vertical)
                        .accentColor(.blue)
                        .background(Capsule().strokeBorder())
                        .opacity(isSecond ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(2), value: isSecond)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    //struct FinishView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        FinishView()
    //    }
    //}
}

//            if todolist.todoItems.count >= 7 {
//                Image("lv6")
//                    .resizable()
//                    .frame(maxWidth: 500)
//            }

//            NavigationLink(destination: ContentView()) {
//                Text("Finish")
//            }.navigationBarBackButtonHidden(true)
//        }
