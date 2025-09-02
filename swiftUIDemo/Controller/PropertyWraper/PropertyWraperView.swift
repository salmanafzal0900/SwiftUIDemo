//
//  PropertyWraperView.swift
//  swiftUIDemo
//
//  Created by Salman Afzal on 02/09/2025.
//

import SwiftUI

struct PropertyWraperView: View {
    
//    @State private var number = 0
//    @ObservedObject var user = User(name: "salman", luyckyNumber: 0)
    @EnvironmentObject var user: User
   @State private var presentModel = false
    
    
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                
                HStack{
                    Text("Number")
                    Text("\(user.luyckyNumber)")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                }
                Group{
                    Button("New Number"){
                        self.user.luyckyNumber = Int.random(in: 1...10)
                    }
                    Button("Show Number"){
                        self.presentModel = true
                    }
                }
                .frame(width: 150)
                .foregroundColor(.white)
                .padding(4)
                .background(Color.blue)
                .cornerRadius(7)

            }
            .sheet(isPresented: $presentModel, content: {
                ModelSheetView(isShowing: self.$presentModel).environmentObject(self.user)
            })
            .navigationTitle("\(user.name)")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button("Left"){
//                        print("Left Button Tapped")
//                    }
                
                    NavigationLink(destination: NavDestinationView()) {
                        Text("go to ")
                    }
                    
                }
            }
        }
     
    }
}

#Preview {
    PropertyWraperView().environmentObject(User(name: "demo", luyckyNumber: 0))
}
