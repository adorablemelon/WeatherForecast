//
//  NetworkRequest.swift
//  NABWeather
//
//  Created by Gia Bao on 7/27/21.
//

import Foundation
import Alamofire
import AlamofireImage
class NetworkRequest{
    static let shared = NetworkRequest()
    private init(){
    }
    
    let urlWeather = "https://api.openweathermap.org/data/2.5/forecast/daily"
    func getWeather(cityName:String,completion: @escaping (WeatherModel,String)->()){
        let parameters: Parameters = [
            "q": cityName,
            "cnt":7,
            "appid":"60c6fbeb4b93ac653c492ba806fc346d",
            "units":"metric"]
        AF.request(urlWeather, method: .get, parameters: parameters)
            .response { response in
                switch(response.result){
                case .failure(let err):
                    print(err.localizedDescription)
                case.success(let data):
                    do{
                        var result = try JSONDecoder().decode(WeatherModel.self, from: data!)
                        if result.list != nil{
                            result.getAverageTemp()
                            result.getDate()
                            completion(result, "pass")
                        }else{
                            completion(result, "fail")
                            return
                        }
                    }catch let err{
                        print(err.localizedDescription)
                    }
                }
            }
    }

    let urlImage = "http://openweathermap.org/img/wn/"
    func getImage(imageID:String,completion: @escaping (UIImage)->()){
        let url = urlImage + imageID + "@2x.png"
        AF.request(url, method: .get, parameters: nil)
            .responseImage(completionHandler: {response in
                switch(response.result){
                case .success(let image):
                    completion(image)

                case .failure(let error):
                    print(error.localizedDescription)
                    let image = UIImage(named: "loading")
                    completion(image!)
                }
                
        })
    }
}

