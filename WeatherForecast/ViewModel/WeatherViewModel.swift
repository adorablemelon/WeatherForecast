//
//  WeatherViewModel.swift
//  NABWeather
//
//  Created by Gia Bao on 7/27/21.
//

import Foundation
import UIKit

    
class WeatherViewModel{
    
    weak var vc: WeatherViewController?
    var model:WeatherModel?
    var imageArr:[UIImage]?
    var tempUIImage:UIImage = UIImage()
    func getWeatherData(cityName:String){
        NetworkRequest.shared.getWeather(cityName: cityName, completion: { [self] (data,status)  in
            if status == "pass"{
                self.model = data
                self.initImgArr()
                self.getWeatherImage()
                DispatchQueue.main.async{
                    self.vc?.weatherTableView.reloadData()
                }
            }else{
                self.model = nil
                DispatchQueue.main.async{
                    self.vc?.weatherTableView.reloadData()
                }
            }
        })
    }
    
    
    func getWeatherImage(){
        for i in 0...(model?.list!.count)!-1{
            NetworkRequest.shared.getImage(imageID: (model?.list![i].weather?[0].icon)!, completion: { [self](image)  in
                self.imageArr![i] = image
                    DispatchQueue.main.async{
                        self.vc?.weatherTableView.reloadData()
                    }
        
            })
        }
    }
    
    func initImgArr(){
        imageArr = [UIImage](repeating: UIImage(named: "loading")!, count: (model?.list!.count)!)
    }
}
