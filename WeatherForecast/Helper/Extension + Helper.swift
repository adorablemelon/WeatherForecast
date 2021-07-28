//
//  Extentsion.swift
//  NABWeather
//
//  Created by Gia Bao on 7/27/21.
//

import Foundation
import UIKit

public class dateFormatterSingleton{
    static let shared = dateFormatterSingleton()
    private init(){
    }
    
    func formatWeekDay(dt:Double)->String{
        let date = (NSDate(timeIntervalSince1970: dt))

        let dateFormatter = DateFormatter()
       // dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.dateFormat = "EE, MMMM dd, yyy"
        let formattedDate: String = dateFormatter.string(from: date as Date)
        return formattedDate
    }
}
public class pickColor{
    static let shared = pickColor()
    private init(){
    }
    let lightGrey = UIColor.init(red: 212.0/255.0, green: 212.0/255.0, blue: 212.0/255.0, alpha: 1.0)

}


extension UIViewController {
    /// Call this once to dismiss open keyboards by tapping anywhere in the view controller
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }

    /// Dismisses the keyboard from self.view
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}
