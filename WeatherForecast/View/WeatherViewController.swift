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
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(callGetWeather), object: nil)
            self.perform(#selector(callGetWeather), with: nil, afterDelay: 1)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        callGetWeather()
        self.view.endEditing(true)
        
    }
    @objc func callGetWeather(){
        print(searchController.searchBar.text!)
        do{
            _ = try ValidationService.shared.validateSearch(searchController.searchBar.text)
            weatherVM.getWeatherData(cityName: searchController.searchBar.text!)
        }catch{
            print(error.localizedDescription)
        }
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
        //validate nonImage data
        do{
            _ = try ValidationService.shared.validateWeatherModel(model: weatherVM.model)
            cell?.model = weatherVM.model?.list![indexPath.row]
        }catch{
            print(error.localizedDescription)
        }
        //validate image
        do{
            _ = try ValidationService.shared.validateImageArray(arrImg: weatherVM.imageArr, modelCount: (weatherVM.model?.list!.count)!)
            cell?.imageViewWeather.image = weatherVM.imageArr![indexPath.row]
        }catch{
            print(error.localizedDescription)
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }


}
    
