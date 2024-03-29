# WeatherForecast

## Require
- iOS 13+
- Xcode 11+


## Installation

Clone the project and open the file 
```
NABWeather.xcworkspace
```

## **Architectural pattern**
- **MVVM**
> Although this is a simple project, but I want to follow the principles above so MVVM is a good choice, it also make the code more clean and easier to read/understand

## Folder structure

<img width="271" alt="Screen Shot 2021-07-29 at 1 45 25 AM" src="https://user-images.githubusercontent.com/40392131/127380144-28939057-e442-4d5f-a736-aa2a36f7fca9.png">

The picture is already straightforward:
- Model folder contains model files
- View folder contains ViewController and TableViewCell, I would have separated Controllers/Cells/UIView into different folders but it wasn't necessary for this project
- ViewModel folder contains ViewModelClass
- Network folder contains Network request classes or services if we have
- Helper folder contains some SINGLETON classes and general extensions

## Framework & Library
- **Alamofire**
> To handle RESTful API
- **AlamofireImage**
> To simplify image download

## Checklist
- Programming language: Swift is required, Objective-C is optional. ✅

- Design app's architecture (MVC or MVP, MVVM). ✅
- UI should be looks like in attachment. ✅
- Write UnitTests (nice to have). ✅
> Although I haven't covered all of the possibilities, I just tested for a certain testcases 
- Exception handling (optional). ✅
> I think I covered most of them but there is always some unfortunate potential
- Readme file included. ✅

