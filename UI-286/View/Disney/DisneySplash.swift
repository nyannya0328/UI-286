//
//  DisneySplash.swift
//  DisneySplash
//
//  Created by nyannyan0328 on 2021/08/16.
//

import SwiftUI

struct DisneySplash: View {
    @State var bowAnimation = false
    @State var startAnimation = false
    @State var growAnimation = false
    @State var showPlusAnimation = false
    @State var plusBGGrowAnimation = false
    @State var endAnimation = false
    var body: some View {
        HStack{
            
            
            if !endAnimation{
                
                ZStack{
                    
                    
                    Color("BG")
                        .ignoresSafeArea()
                    
                    GeometryReader{proxy in
                        
                        let size = proxy.size
                        
                        ZStack{
                            
                            Circle()
                                .trim(from: 0, to:bowAnimation ? 0.5 : 0)
                                .stroke(
                                
                                
                                
                                
                                LinearGradient(colors: [
                                
                                
                                    Color("Gradient1"),
                                    Color("Gradient2"),
                                    Color("Gradient3"),
                                    Color("Gradient4"),
                                    Color("Gradient5"),
                                    Color("BG"),
                                
                                
                                
                                
                                
                                ], startPoint: .leading, endPoint: .trailing),style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)
                                
                                
                                
                                
                                )
                                .overlay(
                                
                                Circle()
                                    .fill(.white.opacity(0.4))
                                    .frame(width: 6, height: 6)
                                    .overlay(
                                    
                                    Circle()
                                        .fill(Color.white.opacity(growAnimation ? 0.2 : 0.1))
                                        .frame(width: 20, height: 20)
                                        
                                    
                                    
                                    )
                                
                                    .blur(radius: 2.5)
                                    .rotationEffect(.init(degrees: bowAnimation ? 180 : 0))
                                    .opacity(startAnimation ? 1 : 0)
                                    .offset(x: (size.width / 2) / 2)
                                
                                
                                )
                            
                            
                                .rotationEffect(.init(degrees: -200))
                                .frame(width: size.width / 2, height: size.height / 2)
                                .offset(y: 15)
                            
                            
                            HStack(spacing : -20){
                                
                                
                                Image("disney")
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: size.width / 1.9, height: size.height / 1.9)
                                    .opacity(bowAnimation ? 1 : 0)
                                
                                
                                Image("plus")
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .background(
                                    
                                        ZStack{
                                            
                                            
                                            Circle()
                                                .fill(.white.opacity(0.25))
                                                .frame(width: 20, height: 20)
                                                .blur(radius: 2)
                                            
                                            
                                            Circle()
                                                .fill(.white.opacity(0.25))
                                                .frame(width: 35, height: 35)
                                                .blur(radius: 2)
                                            
                                            
                                            
                                            
                                        }
                                            .opacity(plusBGGrowAnimation ? 1 : 0)
                                    
                                    
                                    )
                                    .scaleEffect(showPlusAnimation ? 1 : 0)
                                
                                
                                
                            }
                            .foregroundColor(.white)
                            
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        
                    }
                }
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        
                        withAnimation(.linear(duration: 2)){
                            
                            bowAnimation.toggle()
                        }
                        
                        withAnimation(.linear(duration: 2).repeatForever(autoreverses: true)){
                            
                            
                            growAnimation.toggle()
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            
                            
                            
                            withAnimation(.spring()){
                                
                                startAnimation.toggle()
                            }
                            
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            
                            
                            withAnimation(.spring()){
                                showPlusAnimation.toggle()
                                startAnimation.toggle()
                            }
                            
                            
                        }
                        
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            
                            
                            
                            withAnimation(.linear(duration: 0.5)){
                                
                                plusBGGrowAnimation.toggle()
                                
                                
                            }
                            
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                
                                
                                withAnimation(.linear(duration: 0.5)){
                                    
                                    plusBGGrowAnimation.toggle()
                                    
                                    
                                }
                                
                                
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                
                                
                                withAnimation{
                                    
                                    
                                    endAnimation.toggle()
                                }
                                
                                
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                }
            }
        }
    }
}

struct DisneySplash_Previews: PreviewProvider {
    static var previews: some View {
        DisneySplash()
    }
}
