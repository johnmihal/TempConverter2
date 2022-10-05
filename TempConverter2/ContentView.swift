//
//  ContentView.swift
//  TempConverter2
//
//  Created by John Mihal on 7/15/22.
//

import SwiftUI

struct ContentView: View {
    @State var cToF = true
    @State var temp: Double = 0
    @State private var input: String = ""
    @State var color1 = Color.green
    @State var color2 = Color.blue
    
    var body: some View {
        ZStack{
            
            LinearGradient(colors: [
                            color1,
                            color2],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                        .ignoresSafeArea(.all, edges: .all)            
        VStack{
                Button(cToF ? "C° ⭢ F°" : "F° ⭢ C°"){
                    cToF.toggle()
                    temp = Double(input) ?? 0
                    if cToF{
                        temp = (temp*1.8) + 32
                    }else{
                        temp -= 32.0
                        temp = temp * 0.5556
                    }
                    
                }
                .font(.system(size: 25))
                .foregroundColor(Color.white)
                .padding()
                
                Spacer()
                HStack{
                    TextField(
                            "input",
                            text: $input
                        )
                    .foregroundColor(Color.black)
                    .frame(width: 80)
                    .font(.system(size: 25))
                    .padding()
                    .background(Color.white)
                    .multilineTextAlignment(.trailing)
                    
                    .onSubmit {
                        temp = Double(input) ?? 0
                        if cToF{
                            temp = (temp*1.8) + 32
                        }else{
                            temp -= 32.0
                            temp = temp * 0.5556
                        }
                        
                        if cToF{
                            color1 = Color.teal
                            color2 = Color.white
                            
                            if temp > 20{
                                color1 = Color.blue
                                color2 = Color.teal
                            }
                            
                            if temp > 40{
                                color1 = Color.green
                                color2 = Color.blue
                            }
                            
                            if temp > 60{
                                color1 = Color.yellow
                                color2 = Color.green
                            }
                            
                            if temp > 80{
                                color1 = Color.orange
                                color2 = Color.yellow
                            }
                            
                            if temp > 100{
                                color1 = Color.red
                                color2 = Color.orange
                            }
                        }else{
                            color1 = Color.teal
                            color2 = Color.white
                            
                            if temp > 20{
                                color1 = Color.blue
                                color2 = Color.teal
                            }
                            
                            if temp > 5{
                                color1 = Color.green
                                color2 = Color.blue
                            }
                            
                            if temp > 16{
                                color1 = Color.yellow
                                color2 = Color.green
                            }
                            
                            if temp > 26{
                                color1 = Color.orange
                                color2 = Color.yellow
                            }
                            
                            if temp > 38{
                                color1 = Color.red
                                color2 = Color.orange
                            }
                        }
                    }
                        Label(cToF ? "C°" : "F°", systemImage: "book.fill")
                        .font(.system(size: 25))
                        .foregroundColor(Color.white)
                        .labelStyle(TitleOnlyLabelStyle())
                        .padding()
                    
                           
                }
                Spacer()
                Label(cToF ? "Result " + String(temp) + " F°" : "Result " + String(temp) + " C°", systemImage: "book.fill")
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
                    .labelStyle(TitleOnlyLabelStyle())
                    .padding()
                
                            
            }
            .frame(width: 400, height: 450)
        }
        
        
        
    }
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
