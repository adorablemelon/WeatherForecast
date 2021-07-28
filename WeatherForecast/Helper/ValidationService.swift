//
//  ValidationService.swift
//  WeatherForecast
//
//  Created by Gia Bao on 7/28/21.
//

import Foundation
import UIKit
class ValidationService{
    
    static let shared = ValidationService()
    private init(){
    }
    
    func validateSearch(_ searhText:String?) throws ->String{
        guard let text = searhText else {throw ValidationError.invalidValueSearch}
        guard text.count >= 3 else {throw ValidationError.invalidValueSearch}
        return text
    }
    func validateWeatherModel(model:WeatherModel?) throws ->WeatherModel{
        guard let model = model else {throw ValidationError.nilModel}
        return model
    }
    func validateImageArray(arrImg:[UIImage]?, modelCount:Int?) throws ->[UIImage]{
        guard let arr = arrImg else{throw ValidationError.nilModel}
        guard let modelCount = modelCount else {throw ValidationError.nilModel}
        guard arr.count == modelCount else {throw ValidationError.nilImageArr}
        return arr
    }
}


enum ValidationError:LocalizedError{
    case invalidValueSearch
    case nilModel
    case nilImageArr
    var errorDescription: String?{
        switch self {
        case .invalidValueSearch:
            return "Less than 3 character"
        case .nilModel:
            return "model empty"
        case .nilImageArr:
            return "image arr empty or haven't finished loading"
        }
    }
}
