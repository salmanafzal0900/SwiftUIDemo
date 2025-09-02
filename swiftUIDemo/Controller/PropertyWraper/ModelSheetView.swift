//
//  ModelSheetView.swift
//  swiftUIDemo
//
//  Created by Salman Afzal on 02/09/2025.
//

import SwiftUI

struct ModelSheetView: View {
    
    @Binding var isShowing: Bool
//    @Binding var number :Int
//    @ObservedObject var user :User
    @EnvironmentObject var user :User
    
    
    var body: some View {
        NavigationStack {
                  VStack(spacing: 20) {
                      HStack{
                          Text("Your Number")
                          Text("\(user.luyckyNumber)")
                              .foregroundStyle(Color.white)
                              .padding()
                              .background(Color.red)
                      }
                      Button("New Number"){
                          self.user.luyckyNumber = Int.random(in: 1...10)
                      }
                      .frame(width: 150)
                      .foregroundStyle(Color.white)
                      .padding(5)
                      .background(Color.purple)
                      .clipShape(.capsule)
                      // Navigation button
                  }
                  .navigationBarTitle("\(user.name)", displayMode: .inline)
                  .navigationBarItems(trailing:Button("Dismiss"){
                      self.isShowing = false
                  })
              }
        
        
        
    }
}

#Preview {
//    ModelSheetView(isShowing: .constant(true), user: User(name: "Test", luyckyNumber: 0))
    ModelSheetView(isShowing: .constant(true)).environmentObject(User(name: "", luyckyNumber: 0))
}
