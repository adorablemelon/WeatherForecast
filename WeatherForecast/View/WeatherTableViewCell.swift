//
//  TableViewCell.swift
//  NABWeather
//
//  Created by Gia Bao on 7/28/21.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    lazy var dateLabel = UILabel()
    lazy var avgTempLabel = UILabel()
    lazy var pressureLabel = UILabel()
    lazy var humidityLabel = UILabel()
    lazy var descriptionLabel = UILabel()
    lazy var imageViewWeather = UIImageView()
    lazy var stackView = UIStackView()
    var model: List?{
        didSet{
            configData()
        }
    }
    var weatherImage:UIImage?{
        didSet{
            //configImg()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        self.backgroundColor = pickColor.shared.lightGrey
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.frame.size.width*0.3-10).isActive = true
        stackView.axis = .vertical
        stackView.spacing = 10

        stackView.addArrangedSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 15)

        stackView.addArrangedSubview(avgTempLabel)
        avgTempLabel.translatesAutoresizingMaskIntoConstraints = false
        avgTempLabel.font = UIFont.systemFont(ofSize: 15)
        
        stackView.addArrangedSubview(pressureLabel)
        pressureLabel.translatesAutoresizingMaskIntoConstraints = false
        pressureLabel.font = UIFont.systemFont(ofSize: 15)
        
        stackView.addArrangedSubview(humidityLabel)
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.font = UIFont.systemFont(ofSize: 15)

        
        stackView.addArrangedSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 15)
        
        self.addSubview(imageViewWeather)
        imageViewWeather.translatesAutoresizingMaskIntoConstraints = false
        imageViewWeather.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageViewWeather.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        imageViewWeather.contentMode = .center
        imageViewWeather.contentMode = .scaleAspectFit
        let temp = UIImage(named: "loading")
        imageViewWeather.image = temp

    }
    
    func configData(){
        
        if let date = model?.date{
            dateLabel.text = "Date: " + date
        }
        if let temp = model?.temp?.averageTemp{
            avgTempLabel.text = "Average Tempurature: " + String(round(temp)) + "°C"
        }
        if let pressure = model?.pressure{
            pressureLabel.text = "Pressure: " + String(pressure)
        }
        if let humidity = model?.humidity{
            humidityLabel.text = "Humidity: " + String(humidity) + "%"
        }
        if let description = model?.weather?[0].description{
            descriptionLabel.text = "Description: " + description
        }
    }
}
