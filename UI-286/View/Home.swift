//
//  Home.swift
//  Home
//
//  Created by nyannyan0328 on 2021/08/16.
//

import SwiftUI

struct Home: View {
    var bottomEge : CGFloat
    @State var selectdTab = "Mail"
    
    @State var hide = false
    
    init(bottomEge : CGFloat) {
        self.bottomEge = bottomEge
        
        UITabBar.appearance().isHidden  = true
    }
    var body: some View {
        TabView(selection:$selectdTab){
            
            MailView(hide: $hide, bottomEge: bottomEge)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black.opacity(0.03))
                .tag("Mail")
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                PackMainView(size: size)
                   
                
                
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black.opacity(0.03))
                .tag("Meet")
        }
        .overlay(
        
        
            VStack{
                
                
                Button {
                    
                    withAnimation{
                        
                        hide.toggle()
                    }
                    
                } label: {
                    
                    
                    HStack(spacing:hide ? 0 : 10){
                        
                        
                        Image(systemName: "pencil")
                            .font(.title3.italic())
                        
                        Text("Compose")
                            .font(.title3.bold())
                            .frame(width: hide ? 0 : nil, height:  hide ? 0 : nil)
                    }
                    .foregroundColor(Color("Pink"))
                    .padding(.vertical,hide ? 15 : 10)
                    .padding(.horizontal)
                    .background(Color("TabBG"),in: Capsule())
                    .opacity(selectdTab == "Mail" ? 1 : 0)
                    .animation(.none, value: selectdTab)
                    .shadow(color: .red.opacity(0.3), radius: 5, x: -5, y: -5)
                    
                    
                    
                }
                .padding(.trailing,5)
                .frame(maxWidth: .infinity, alignment: .trailing)

                
                
                CustomTabView(currentTab: $selectdTab, bottomEge: bottomEge)
            }
                .offset(y: hide ? (65 + bottomEge) : 0)
          
        ,alignment: .bottom
        
        )
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
