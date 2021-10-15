//
//  UserInformationView.swift
//  MidtermApp
//
//  Created by Алишер Алсейт on 15.10.2021.
//

import SwiftUI

struct UserInformationView: View {
    enum Field {
        case firstName
        case phoneNumber
    }
    
    @State private var firstName = ""
    @State private var phoneNumber = ""
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name")
            HStack {
                TextField("Enter your  name", text: $firstName)
                    .font(.title3)
                    .focused($focusedField, equals: .firstName)
                    .textContentType(.givenName)
                    .submitLabel(.next)
                
                Button(action: {
                    firstName = ""
                }, label: {
                    Text("Edit")
                        .foregroundColor(.gray)
                })
                    
            }
            
            .padding(8)
            .background(Color("Background 2"))
            .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .padding(.vertical, 8)
            
                
               
            
            Text("Telephone")
            TextField("Enter your phone number", text: $phoneNumber)
                .font(.title3)
                .padding(8)
                .background(Color("Background 2"))
                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .padding(.vertical, 8)
                .focused($focusedField, equals: .phoneNumber)
                .textContentType(.telephoneNumber)
                .submitLabel(.join)
            
            //            Spacer()
        }
        .padding(16)
        .frame(width: 350, height: 250)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color("dropshadow-blue"), radius: 5, x: 0, y: 2)
        .shadow(color: Color("dropshadow-blue"), radius: 20, x: 0, y: 10)
        .padding()
        .onSubmit {
            switch focusedField {
            case .firstName:
                focusedField = .phoneNumber
            default:
                print("Jounung chat room...")
            }
        }
        
    }
}

struct UserInformationView_Previews: PreviewProvider {
    static var previews: some View {
        UserInformationView()
    }
}
