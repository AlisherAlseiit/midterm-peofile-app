//
//  Home.swift
//  MidtermApp
//
//  Created by Алишер Алсейт on 15.10.2021.
//

import SwiftUI

struct Home: View {
    
    @State var selectedtab = "house"
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    
    @State var xAxis: CGFloat = 0
    
    @Namespace var animation
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView(selection: $selectedtab){
                
                Color("color1")
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("house")
                
                
                ContentView()
                    .tag("rectangle.3.offgrid")
                
                Color.purple
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("person")
                
                
            }
            
            // Custom tab Bar...
            
            HStack(spacing: 0){
                
                ForEach(tabs,id: \.self){image in
                    
                    GeometryReader {reader in
                        Button(action: {
                            withAnimation(.spring()){
                                selectedtab = image
                                xAxis = reader.frame(in: .global).minX
                            }
                        }, label: {
                            
                            Image(systemName: image)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(selectedtab == image ? getColor(image: image) : Color.gray)
                                .padding(selectedtab == image ? 15 : 0)
                                .background(Color.white.opacity(selectedtab == image ? 1 : 0).clipShape(Circle()))
                                .matchedGeometryEffect(id: image, in: animation)
                                .offset(x: selectedtab == image ? (reader.frame(in: .global).minX - reader.frame(in: .global).midX) : 0,y: selectedtab == image ? -50 : 0)
                            
                        })
                        .onAppear(perform: {
                            
                            if image == tabs.first{
                                xAxis = reader.frame(in: .global).minX
                            }
                        })
                    }
                    .frame(width: 25, height: 30)
                    
                    if image != tabs.last{Spacer(minLength: 0)}
                }
            }
            .padding(.horizontal,30)
            .padding(.vertical)
            .background(Color.white.clipShape(CustomShape(xAxis: xAxis)).cornerRadius(12))
            .padding(.horizontal)
            // Bottom Edge...
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .shadow(color: Color("dropshadow-blue"), radius: 5, x: 0, y: 2)
            .shadow(color: Color("dropshadow-blue"), radius: 20, x: 0, y: 10)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    
    
    func getColor(image: String)->Color{
        
        switch image {
        case "house":
            return Color("color1")
        case "rectangle.3.offgrid":
            return Color("color2")
        case "person":
            return Color.purple
        default:
            return Color.blue
        }
    }
}
var tabs = ["house","rectangle.3.offgrid","person.fill"]



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
