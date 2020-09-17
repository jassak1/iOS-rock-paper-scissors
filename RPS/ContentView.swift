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
                            if (Sitem==0){
                                self.userCho=0
                            }
                            else if (Sitem==1){
                                self.userCho=1
                            }
                            else{
                                self.userCho=2
                            }
                            self.didWin()
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
  
    func didWin() {
        if(nextRnd){
        switch userCho {
        case 0:                 // USER CHOOSES ROCK
            switch randPick {
            case 0:
                infotainment="NOPE! THAT WAS MATCH."
                (score>0) ? score-=1 : (score=0)
            case 1:
                switch istrue {
                case true:
                    infotainment="TRY AGAIN!"
                    (score>0) ? score-=1 : (score=0)
                case false:
                    infotainment="CORRECT!"
                    score+=1
                }
            case 2:
                switch istrue {
                case true:
                    infotainment="CORRECT!"
                    score+=1
                case false:
                    infotainment="TRY AGAIN!"
                    (score>0) ? score-=1 : (score=0)
                }
            default:
                print("NA")
            }
            
        case 1:                 // USER CHOOSES PAPER
            switch randPick {
            case 1:
                infotainment="NOPE! THAT WAS MATCH."
                (score>0) ? score-=1 : (score=0)
            case 2:
                switch istrue {
                case true:
                    infotainment="TRY AGAIN!"
                    (score>0) ? score-=1 : (score=0)
                case false:
                    infotainment="CORRECT!"
                    score+=1
                }
            case 0:
                switch istrue {
                case true:
                    infotainment="CORRECT!"
                    score+=1
                case false:
                    infotainment="TRY AGAIN!"
                    (score>0) ? score-=1 : (score=0)
                }
            default:
                print("NA")
            }
            
        case 2:                 // USER CHOOSES SCISSORS
            switch randPick {
            case 2:
                infotainment="NOPE! THAT WAS MATCH"
                (score>0) ? score-=1 : (score=0)
            case 0:
                switch istrue {
                case true:
                    infotainment="TRY AGAIN!"
                    (score>0) ? score-=1 : (score=0)
                case false:
                    infotainment="CORRECT!"
                    score+=1
                }
            case 1:
                switch istrue {
                case true:
                    infotainment="CORRECT!"
                    score+=1
                case false:
                    infotainment="TRY AGAIN!"
                    (score>0) ? score-=1 : (score=0)
                }
            default:
                print("NA")
            }
            
        default:
            print("NA")
        }
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



