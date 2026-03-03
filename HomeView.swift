

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack {
            Text("Personalized Itinerary for " + (information.name))
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()

            Image(information.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(40)

            Text(information.name)
                .font(.title)
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
