//
//  ContentView.swift
//  Shared
//
//  Created by Luthfi Khan on 28/05/22.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronauts]  = Bundle.main.decode("astronauts.json")
    let missions: [Mission]  = Bundle.main.decode("missions.json")
    
    let colums = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: colums){
                    ForEach(missions){mission in
                        NavigationLink{
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack{
                                Image(mission.imageString)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack{
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.darkBackground)
                                .preferredColorScheme(.dark)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.lightBackground))
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
                .navigationTitle("Moonshot")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
