//
//  WeatherModel.swift
//  NABWeather
//
//  Created by Gia Bao on 7/27/21.
//

import Foundation

struct Temp:Decodable{
    var min:Float?
    var max:Float?
    var averageTemp:Float?
}
struct Weather:Decodable{
    var description:String?
    var icon:String?
}
struct List:Decodable{
    var dt:Double?
    var date:String?
    var temp:Temp?
    var weather:[Weather]?
    var humidity:Int?
    var pressure:Int?
    
}
struct WeatherModel:Decodable{
    var list:[List]?
}



extension WeatherModel{
    mutating func getAverageTemp(){
        if list != nil{
            for i in 0...list!.count-1{
                list?[i].temp?.calculateAverageTemp()
            }
        }
    }
    mutating func getDate(){
        if list != nil{
            for i in 0...list!.count-1{
                list?[i].getDate()
            }
        }
    }
}
extension Temp{
    mutating func calculateAverageTemp(){
        if min != nil && max != nil {
            averageTemp = (min! + max!)/2
        }else{
            return
        }
    }
}
extension List{
    mutating func getDate(){
        if dt != nil {
            date = dateFormatterSingleton.shared.formatWeekDay(dt: dt!)
        }
    }
}

