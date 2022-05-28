//
//  AstronautView.swift
//  Moonshot
//
//  Created by Luthfi Khan on 28/05/22.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronauts
    
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronauts] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
    }
}
