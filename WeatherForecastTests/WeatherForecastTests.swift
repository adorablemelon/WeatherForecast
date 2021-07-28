//
//  WeatherForecastTests.swift
//  WeatherForecastTests
//
//  Created by Gia Bao on 7/28/21.
//

import XCTest
@testable import WeatherForecast

class WeatherForecastTests: XCTestCase {
    func test_is_valid_search_less_3_chac() throws{
        let expectedError = ValidationError.invalidValueSearch
        var error:ValidationError?
        XCTAssertThrowsError(try ValidationService.shared.validateSearch("Ne")){
            throwError in
            error = throwError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)

    }
    func test_is_valid_search_text_length() throws{
        XCTAssertNoThrow(try ValidationService.shared.validateSearch("New York"))
    }
    func test_is_valid_no_nil_model() throws{
        let tempModel = WeatherModel()
        XCTAssertNoThrow(try ValidationService.shared.validateWeatherModel(model: tempModel))
    }
    
    func test_is_valid_nil_model() throws{
        let expectedError = ValidationError.nilModel
        var error:ValidationError?
        XCTAssertThrowsError(try ValidationService.shared.validateWeatherModel(model: nil)){
            throwError in
            error = throwError as? ValidationError
        }
        print(expectedError, error!)
        print("a")
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
   
}
    

   


