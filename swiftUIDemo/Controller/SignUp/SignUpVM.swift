//
//  SignUpVM.swift
//  swiftUIDemo
//
//  Created by Salman Afzal on 01/09/2025.
//

import Foundation
import Combine
import SwiftUI

class SignUpVM: ObservableObject{
    
    private var cancellableBag = Set<AnyCancellable>()
    
    @Published var userName:String = ""
    var errorUserNameValue:String = ""
    @Published var email :String = ""
    var errorEmailValue:String = ""
    @Published var password :String = ""
    var errorPasswordValue:String = ""
    @Published var confirmPassword :String = ""
    var errorConfirmPasswordValue:String = ""
    
    private var userNameValuePublisher: AnyPublisher<Bool, Never> {
        // Never = never sends an error in case of UI | Error = send an error in case of APIs
        return $userName
            .map { !$0.isEmpty }   // $0 = the latest value of userName (likely a String)
            .eraseToAnyPublisher()
    }
    
    
    init(){
        userNameValuePublisher
            .receive(on: RunLoop.main)
            .dropFirst()
            .map{$0 ? "" : "Usrname is required"}
            .assign(to: \.errorUserNameValue, on: self)
            .store(in: &cancellableBag)
    }
}
