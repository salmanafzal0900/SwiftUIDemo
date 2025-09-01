//
//  SignUpView.swift
//  swiftUIDemo
//
//  Created by Salman Afzal on 01/09/2025.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject private var viewModel:SignUpVM
    
    init(viewModel:SignUpVM) {
        self.viewModel = viewModel
    }
    
    
    var isSecure :Bool = false
    var keyboardType :UIKeyboardType = .default
    
   
    
    var body: some View {
        ZStack{
            Color.green.edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Sign UP")
                    .font(Font.custom("Noteworthy-Bold", size: 40.0))
                    .foregroundColor(.white)
                    .padding(.bottom, 20.0)
                AuthTextFielf(title: "User Name", userName: $viewModel.userName, errorValue: viewModel.errorUserNameValue)
                AuthTextFielf(title: "Email", userName: $viewModel.email, errorValue: viewModel.errorEmailValue, keyboardType: .emailAddress)
                AuthTextFielf(title: "Password", userName: $viewModel.password, errorValue: viewModel.errorPasswordValue, isSecure: true)
                AuthTextFielf(title: "Confirm Password", userName: $viewModel.confirmPassword, errorValue: viewModel.errorConfirmPasswordValue, isSecure: true)
                Button(action: signUp) {
                    Text("Sign Up")
                }
                .foregroundColor(Color.white)
                .frame(minWidth: 0.0, maxWidth: .infinity)
                .padding()
                .background(Color.black)
                .cornerRadius(.infinity)
                .padding(.top, 20.0)
                
               
            
                
            }.padding(60.0)
            
        }
    }
    
    func signUp(){
        print("Sign Up Clocked")
    }
}

#Preview {
    SignUpView(viewModel: SignUpVM())
}

struct AuthTextFielf: View {
    
    var title : String
    @Binding var userName: String
    var errorValue:String
    var isSecure : Bool = false
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack {
            
            if isSecure{
                SecureField(title, text: $userName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .keyboardType(.default)
            }else{
                TextField(title, text: $userName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .keyboardType(.default)
            }
            Text(errorValue)
                .fontWeight(.light)
                .foregroundColor(Color.red)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
        }
    }
}
