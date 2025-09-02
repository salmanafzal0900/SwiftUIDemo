//
//  NavDestinationView.swift
//  swiftUIDemo
//
//  Created by Salman Afzal on 02/09/2025.
//

import SwiftUI

struct NavDestinationView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Text("\(user.luyckyNumber)")
                Text("??")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.blue)
            }
            Button("New Number"){
                self.user.luyckyNumber = Int.random(in: 21...30)
            }
            .frame(width: 150)
            .foregroundColor(.white)
            .padding(5)
            .background(Color.green)
            .cornerRadius(7)
        }
        .frame(width: 200)
        .navigationBarTitle("\(user.name)", displayMode: .inline)
    }
}

#Preview {
    NavDestinationView().environmentObject(User(name: "test", luyckyNumber: 0))
}
