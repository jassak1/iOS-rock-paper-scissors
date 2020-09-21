//
//  ContentView.swift
//  RPS
//
//  Created by Kardan on 17/09/2020.
//  Copyright © 2020 Kardan. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    var gamesets=["ROCK","PAPER","SCISSORS"]
    @State var istrue=Bool.random()
    var tx: some View{
        Text(istrue ? "      WIN !" : "   LOOSE !")
            .foregroundColor(.yellow)
            .font(.largeTitle)
            .fontWeight(.black)
    }
    @State var picked:Int=2
    var SFicons=["hammer.fill","doc.text.fill","scissors"]
    @State var score:Int=0
    @State var infotainment=String()
    @State var randPick=Int.random(in: 0...2)
    @State var userCho=Int()
    @State var nextRnd:Bool=true
    var infowin:String="CORRECT!"
    var infoagain:String="TRY AGAIN!"
    var body: some View {
        ZStack {
            Color("Bckgrnd")
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color("Bckgrnd"))
                .frame(width: 400, height: 420)
                .onTapGesture {
                    self.infotainment=""
                    self.randPick=Int.random(in: 0...2)
                    self.istrue=Bool.random()
                    self.nextRnd=true
            }
            
            VStack {
                choice(choosen: gamesets[randPick])
                    .padding(.top,20)
                    .padding(.bottom,50)
                LinearGradient(gradient: Gradient(colors: istrue ? ([.green,.blue]) : ([.yellow,.red])), startPoint: .leading, endPoint: .trailing)
                    .frame(width: 160, height: 40)
                    .mask(tx)
                Spacer()
            }
            VStack{
                Spacer()
                HStack(spacing:50) {
                    ForEach(0..<3) { Sitem in
                        Button(action:{
                            if(self.nextRnd){
                                switch Sitem {
                                case 0:
                                    self.iRock()
                                case 1:
                                    self.iPaper()
                                case 2:
                                    self.iScissors()
                                default:
                                    print("NA")
                                }
                            }
                            self.nextRnd=false
                        }){
                            ZStack {
                                Image(systemName: self.SFicons[Sitem])
                                    .foregroundColor(.yellow)
                                    .font(.system(size: 40))
                                Text(self.gamesets[Sitem])
                                    .foregroundColor(.pink)
                                    .fontWeight(.black)
                                    .font(.body)
                            }
                        }
                    }
                }
                .padding(.bottom,50)
            }
            HStack {
                Spacer()
                VStack() {
                    Text(String(score))
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.yellow)
                    Spacer()
                }
                .padding(.trailing,30)
            }
            Text(infotainment)
                .font(.title)
                .fontWeight(.black)
                .foregroundColor((infotainment=="CORRECT!") ? (Color.yellow) : (Color.red))
                .padding(.top,150)
            Text("Select Your Move:")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(Color.yellow)
                .padding(.top,400)
            
        }
        
    }
    
    func shwin(){
        score+=1
        infotainment=infowin
    }
    func shagain(){
        (score>0) ? score-=1 : (score=0)
        infotainment=infoagain
    }
    
    func iRock(){
        if((randPick==2 && istrue) || (randPick==1 && !istrue)){
            shwin()
        }
        else{
            shagain()
        }
    }
    
    func iPaper(){
        if((randPick==0 && istrue) || (randPick==2 && !istrue)){
            shwin()
        }
        else{
            shagain()
        }
    }
    
    func iScissors(){
        if((randPick==0 && !istrue) || (randPick==1 && istrue)){
            shwin()
        }
        else{
            shagain()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct choice: View {
    var choosen=String()
    var body: some View {
        Image(choosen)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black,lineWidth: 0.5))
            .shadow(color: .white, radius: 5,x: 2,y: 2)
            .shadow(color: .yellow, radius: 5,x: -2,y: -2)
    }
}



