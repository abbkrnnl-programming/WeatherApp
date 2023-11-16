//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Абубакир on 03.11.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location{
                if let weather = weather{
                    WeatherView(weather: weather)
                } else{
                    LoadingView()
                        .task{
                            do{
                                weather = try await weatherManager.getCurentWeather(
                                    latitude: location.latitude,
                                    longitude: location.longitude)
                            } catch{
                                print("Error cathing weather: \(error)")
                            }
                        }
                }
            } else{
                if locationManager.isLoading {
                    LoadingView()
                } else{
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(red: 1/255, green: 44/255, blue: 73/255, opacity: 1.0))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
