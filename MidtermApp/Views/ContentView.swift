//
//  ContentView.swift
//  MidtermApp
//
//  Created by Алишер Алсейт on 15.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        
        NavigationView {
            ScrollView {
            VStack {
                UserInformationView()
                
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(Color.blue)
                            .frame(height: 50)
                        
                        Text("Product adding history")
                            .foregroundColor(.white)
                    }
                    
                }
                .padding()
                .navigationBarTitle("Profile")
//                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Image(systemName: "rectangle.portrait.and.arrow.right"))
                
                
                Spacer()
            }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
