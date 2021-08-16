//
//  CustomTabView.swift
//  CustomTabView
//
//  Created by nyannyan0328 on 2021/08/16.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var currentTab : String
    var bottomEge : CGFloat
    var body: some View {
        HStack{
            
            
            ForEach(["Mail","Meet"],id:\.self){image in
                
                
                CustomTabar(image: image, selected: $currentTab, badge: image == "Mail" ? 99 : 0)
                
                
            }
            
        }
        .padding(.top,15)
        .padding(.bottom,bottomEge)
        .background(Color("TabBG"))
        
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabar : View{
    
    var image : String
    @Binding var selected : String
    
    @Environment(\.colorScheme) var scheme
    
    var badge : Int
    
    var body: some View{
        
        Button {
            withAnimation{selected = image}
            
            
        } label: {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .frame(width: 50, height: 50)
                .foregroundStyle(selected == image ? Color("Pink") : .gray.opacity(0.3))
                .overlay(
                
                    
                    Text("\(badge < 100 ? badge : 99)+")
                        .font(.caption.bold())
                        .foregroundColor(scheme == .dark ? .black : .white)
                        .padding(.vertical,5)
                        .padding(.horizontal,5)
                        .background(Color("Pink"),in: Capsule())
                        .background(
                        
                        
                        Capsule()
                            .stroke(scheme == .dark ? .black : .white,lineWidth:1.3)
                        
                        
                        )
                        .opacity(badge == 0 ? 0 : 1)
                        .offset(x: 13, y: -9)
                    
                    ,alignment: .topTrailing
                    
                  
                
                
                
                )
                .frame(maxWidth: .infinity)
        }
    }
}
