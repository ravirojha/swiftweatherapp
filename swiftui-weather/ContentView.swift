//
//  ContentView.swift
//  swiftui-weather
//
//  Created by Ravi Ranjan  Ojha on 20/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : Color("lightBlue"))
            
            VStack {
                CityTextView(cityName: "Varanasi, UP, India")
                MainWeatherStatysView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 27)
                
                
                HStack(spacing: 25){
                    WeatherDayView(daayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 28)
                    WeatherDayView(daayOfWeek: "WED", imageName: "sun.max.fill", temperature: 32)
                    WeatherDayView(daayOfWeek: "THU", imageName: "cloud.rain.fill", temperature: 23)
                    WeatherDayView(daayOfWeek: "FRI", imageName:  "sunset.fill", temperature: 25)
                    WeatherDayView(daayOfWeek: "SAT", imageName: "wind", temperature: 27)
                }
                
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(buttonText: "Change Day Time", backgroundColor: .white, textColor: .blue)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var daayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(daayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, design: .default))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}


struct MainWeatherStatysView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
            
        }
        .padding(.bottom, 40)
    }
}



