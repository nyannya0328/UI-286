//
//  MailView.swift
//  MailView
//
//  Created by nyannyan0328 on 2021/08/16.
//

import SwiftUI

struct MailView: View {
    @Binding var hide : Bool
    var bottomEge : CGFloat
    @State var offset : CGFloat = 0
    @State var lastOffset : CGFloat = 0
  
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            HStack{
                
                Text("Primary")
                    .font(.largeTitle.weight(.black))
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading,10)
                
                Spacer()
                
                Button {
                    
                    
                    withAnimation{
                        
                        
                    }
                    
                    
                    
                    
                    
                } label: {
                    Image("pack")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.black)
                }

            }
            .padding(.horizontal)
            
            VStack(spacing:20){
                
                ForEach(messages){msg in
                    
                    
                    cardView(msg: msg)
                }
                
                
                
            }
           
            .overlay(
            
            
                GeometryReader{proxy -> Color in
                    
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    
                    let durationoffset : CGFloat = 35
                    
                    DispatchQueue.main.async {
                        if minY < offset{
                            
                            
                            if offset < 0 && -minY > (lastOffset + durationoffset){
                                
                                
                                withAnimation(.easeInOut.speed(1.5)){
                                    
                                    
                                    hide = true
                                }
                                
                                lastOffset = -offset
                            }
                            
                            
                            
                        }
                        
                        if minY > offset && -minY < (lastOffset - durationoffset){
                            
                            
                            
                            withAnimation(.easeInOut.speed(1.5)){
                                
                                
                                hide = false
                            }
                            
                            lastOffset = -offset
                            
                            
                        
                            
                            
                            
                        }
                        
                        self.offset = minY
                        
                    }
                    
                    
                    
                    return Color.clear
                }
            
            )
            .padding()
            
        }
        .coordinateSpace(name: "SCROLL")
       
       
        
        
    }
       
    
    @ViewBuilder
    
    func cardView(msg : Message) -> some View{
        
        
        HStack{
            
            
            Text(String(msg.userName.first ?? "x"))
                .font(.title.italic())
                .foregroundColor(.black)
                .padding()
                .background(msg.tintColor,in: Circle())
            
            
            VStack(alignment: .leading, spacing: 15) {
                
                
                
                Text(msg.userName)
                    .font(.title.italic())
                    .foregroundColor(msg.tintColor)
                
                
                Text(msg.message)
                    .font(.caption.bold())
                    .foregroundColor(.gray)
                
            }
            
            
            
            
        }
        
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct MailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
