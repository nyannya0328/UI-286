//
//  PackMainView.swift
//  PackMainView
//
//  Created by nyannyan0328 on 2021/08/16.
//

import SwiftUI

struct PackMainView: View {
    var size : CGSize
    @State var offset : CGFloat = 0
    var body: some View {
        VStack{
            
            
            HStack{
                
                
                Image("pack")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 60, height: 60)
                    .padding(.leading,10)
                    .shadow(color: .red.opacity(0.3), radius: 5, x: 5, y: 5)
                    .blur(radius: 2)
                
                
                Spacer(minLength: 0)
                
                
                
                Button {
                    
                } label: {
                    (
                    
                    Text(Image(systemName: "gear"))
                    
                    
                    +
                    
                    Text("Settings")
                    
                    
                    )
                        .font(.title2.bold())
                        .foregroundColor(.primary)
                        .shadow(radius: 10)
                      
                }

                
                
                
                
            }
            .padding(.horizontal)
                
            .frame(maxWidth: .infinity, alignment: .leading)
            
            offsetPageTabView(offset: $offset) {
                
                
                HStack(spacing:0){
                    
                    
                    ForEach(intros){intro in
                        
                        
                        VStack{
                            
                            
                            
                            Image(intro.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: size.height / 3)
                            
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text(intro.title)
                                    .font(.title.italic())
                                    
                                
                                Text(intro.discription)
                                    .font(.title3.italic())
                                
                                
                            }
                            .padding(.top,50)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                               
                            
                            
                            
                        }
                        .frame(width: size.width)
                        
                    }
                    
                    
                    
                }
                
            }
            
            
            HStack(alignment:.bottom){
                
                HStack(spacing:10){
                    
                    
                    ForEach(intros.indices,id:\.self){intro in
                        
                        
                        Circle()
                            .fill(.black)
                            .frame(width: getIndex() == intro ? 20 : 7, height: 7)
                        
                    }
                    
                }
                .overlay(
                
                Capsule()
                    .fill(.black)
                    .frame(width: 20, height: 7)
                    .offset(x: indicatoroffset())
                
                
                ,alignment: .leading
                
                )
                .offset(x: 10, y: -15)
                .padding()
               
                
                
                Spacer()
                
                Button {
                    
                    let index = min(backIndex() - 1, intros.count - 2)
                    
                    offset = CGFloat(index) * size.width
                    
                    
                } label: {
                    
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.vertical,15)
                        .padding(.horizontal)
                        .background(intros[getIndex()].randoms,in: Circle())
                }
                
                
                Button {
                    
                    let index = min(getIndex() + 1, intros.count - 1)
                    
                    offset = CGFloat(index) * size.width
                    
                    
                } label: {
                    
                    Image(systemName: "chevron.right")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.vertical,15)
                        .padding(.horizontal)
                        .background(intros[getIndex()].randoms,in: Circle())
                }

            }
            .padding()
            .offset(x: -20)
            
           

            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .padding(.bottom,100)
        .background(
        
            
            LinearGradient(colors: [
            
            
                .red.opacity(0.3),
                .orange.opacity(0.3),
                .green.opacity(0.3),
                .yellow.opacity(0.3),
                .purple.opacity(0.3),
            
            
            
            ], startPoint: .top, endPoint: .bottom)
        
        
        
        
        
                )
       
        .animation(.easeIn.speed(0.5), value: getIndex())
    }
    
    func getIndex()->Int{
        let progress = round(offset / size.width)
        
        let index = min(Int(progress), intros.count - 1)
        
        return index
        
    }
    
    func indicatoroffset()->CGFloat{
        
        
        let progress = offset / size.width
        
        let maxWidth : CGFloat = 10 + 7
        
        return progress * maxWidth
    }
    
    func backIndex()->Int{
        
        let progress = round(offset / size.width)
        
        let index = max(Int(progress), intros.count - 2)
        
        return index
        
        
    }
}

struct PackMainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


