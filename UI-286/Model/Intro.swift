//
//  Intro.swift
//  Intro
//
//  Created by nyannyan0328 on 2021/08/16.
//

import SwiftUI
let colors : [Color] = [.red,.green,.orange,.blue,.purple]


struct Intro: Identifiable {
    
    var id = UUID().uuidString
    var image : String
    var title : String
    var discription : String
    var randoms = colors.randomElement() ?? .red
   
}

var intros : [Intro] = [


    Intro(image: "pic1", title: "Choooooose", discription: "The best in Dog"),

    Intro(image: "pic2", title: "Find the best Pet", discription: "Find it!"),

    Intro(image: "pic2", title: "Yeah,Son Pet", discription: "I'm going to happy"),





]
