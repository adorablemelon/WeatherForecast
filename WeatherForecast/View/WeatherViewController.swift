//
//  ViewController.swift
//  NABWeather
//
//  Created by Gia Bao on 7/27/21.
//

import UIKit
class WeatherViewController: UIViewController{
    
    @IBOutlet weak var weatherTableView: UITableView!
    var weatherVM:WeatherViewModel = WeatherViewModel()
    let searchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherVM.vc = self
        self.setupHideKeyboardOnTap()
        setupTableView()
        setupNavigationBar()
    }
}


extension WeatherViewController:UINavigationBarDelegate,UISearchBarDelegate{
    func setupNavigationBar(){
        self.title = "Weather Forecast"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
  
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count >= 3 {
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(callGetWeather), object: nil)
            self.perform(#selector(callGetWeather), with: nil, afterDelay: 1)
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        callGetWeather()
    }
    @objc func callGetWeather(){
        print(searchController.searchBar.text!)
        weatherVM.getWeatherData(cityName: searchController.searchBar.text!)
    }
}
extension WeatherViewController:UITableViewDataSource,UITableViewDelegate{
    
    func setupTableView(){
        weatherTableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: "cell")
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = weatherVM.model?.list!.count{
            return count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WeatherTableViewCell
        if weatherVM.model != nil{
            cell?.model = weatherVM.model?.list![indexPath.row]
        }
        if weatherVM.imageArr?.count != 0 && weatherVM.imageArr?.count == weatherVM.model?.list?.count{
            cell?.imageViewWeather.image = weatherVM.imageArr![indexPath.row]
            print(weatherVM.imageArr![indexPath.row])
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }


}
    
