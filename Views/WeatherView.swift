//
//  WeatherView.swift
//  WeatherAppSwiftUI
//
//  Created by Абубакир on 04.11.2023.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .font(.title)
                        .bold()
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "cloud.rain")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_1280.png")){
                        image in image
                            .image?.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .fontWeight(.bold)
                        .padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min temp", value: weather.main.tempMin.roundDouble() + "°")
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Max temp", value: weather.main.tempMax.roundDouble() + "°")
                    }
                    
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + "m/s")
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + "%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(red: 1/255, green: 44/255, blue: 73/255, opacity: 1.0))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(red: 1/255, green: 44/255, blue: 73/255, opacity: 1.0))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
