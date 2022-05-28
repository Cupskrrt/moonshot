//
//  MissionView.swift
//  Moonshot
//
//  Created by Luthfi Khan on 28/05/22.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember{
        let role: String
        let astronaut: Astronauts
    }
    
    let missios: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                VStack{
                    Image(missios.imageString)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    VStack(alignment: .leading){
                        //Custom Divider
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom)
                        
                        Text(missios.description)
                        
                        //Custom Divider
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom)
                        
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(crew, id: \.role) {crewMember in
                                NavigationLink{
                                    AstronautView(astronaut: crewMember.astronaut)
                                }label: {
                                    HStack {
                                        Image (crewMember.astronaut.id)
                                            .resizable()
                                            .frame(width: 104, height: 72)
                                            .clipShape(Capsule())
                                            .overlay(Capsule().strokeBorder(.white, lineWidth: 1))
                                    }
                                    
                                    VStack(alignment: .leading){
                                        Text(crewMember.astronaut.name)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        
                                        Text(crewMember.role)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(missios.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronauts]){
        self.missios = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronauts] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
