//
//  MainVC.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 01/03/2022.
//

import MapKit

protocol MainVCProtocol: UIViewController {
    func showLoader()
    func hideLoader()
    func showAlert(message: String)
    func setupSala(sala: Salawat)
}

class MainVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var mainView: MainView!
    
    //MARK:- Propreties
    var viewModel: MainViewModelProtocol!

    //MARK:- LifeCycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.setup()
        setBackgroundImage()
        viewModel.getSala()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        viewModel.checkChanges()
    }
    
    // MARK:- Public Methods
    class func create() -> MainVC {
        let mainVC: MainVC = UIViewController.create(storyboardName: Storyboards.main, identifier: "\(MainVC.self)")
        mainVC.viewModel = MainViewModel(view: mainVC)
        return mainVC
    }
    
    //MARK:- Actions
    @IBAction func changeLocationBtnTapped(_ sender: UIButton) {
        let mainStoryBoard = UIStoryboard(name: Storyboards.main, bundle: nil)
        let mapVC = mainStoryBoard.instantiateViewController(withIdentifier: ViewController.mapVC) as! MapVC
        mapVC.delegate = self
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
}

//MARK:- MainVCProtocol
extension MainVC: MainVCProtocol{
    func setupSala(sala: Salawat) {
        self.mainView?.setupSalaData(sala)
    }
    func showLoader() {
        self.mainView?.showLoader()
    }
    func hideLoader() {
        self.mainView?.hideLoader()
    }
    func showAlert(message: String) {
        self.showAlert(title: L10n.sorry, message: L10n.error)
    }
}

//MARK:- MapWithCurrentLocationDelegate
extension MainVC: MapWithCurrentLocationDelegate{
    func setDelailLocationInAddress(delailsAddress: String, lat: Double, log: Double) {
        UserDefultsManger.shared().city = delailsAddress
        UserDefultsManger.shared().lat = lat
        UserDefultsManger.shared().log = log
        mainView?.setupLocationLabel(address: delailsAddress)
        viewModel.getAPIData(lat: lat, log: log)
    }
}
