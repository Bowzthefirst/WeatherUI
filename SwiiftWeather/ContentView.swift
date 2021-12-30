//
//  ContentView.swift
//  SwiiftWeather
//
//  Created by Alexander Bowser on 12/30/21.
//

import SwiftUI

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusview: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            Text("\(temperature)")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}


struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}


struct WeatherButton: View {
    var title: String
    var textaColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 200, height: 50)
            .background(backgroundColor)
            .foregroundColor(textaColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                Text("Capecod MA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                MainWeatherStatusview(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 66)
                    .padding(.bottom, 40)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 67)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.dust.fill", temperature: 60)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.bolt.fill", temperature: 63)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.haze.fill", temperature: 53)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sun.max.fill", temperature: 45)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sun.haze.fill", temperature: 40)
                    WeatherDayView(dayOfWeek: "SUN", imageName: "snow", temperature: 32)

                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Chnage Day Time", textaColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
