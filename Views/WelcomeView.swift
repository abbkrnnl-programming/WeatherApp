//
//  WelcomeView.swift
//  WeatherAppSwiftUI
//
//  Created by Абубакир on 03.11.2023.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome to the Weather app!")
                    .bold()
                    .font(.title2)
                
                Text("Please share your current location to get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(35.0)
            .symbolVariant(.fill)
            .foregroundColor(Color.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
