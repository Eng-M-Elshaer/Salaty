//
//  APIManager.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 07/03/2022.
//

import Alamofire

class APIManager {
    class func getDataFromAPI(_ params: SalatyParameters, completion: @escaping (_ error: Error?, _ dataArray: [TimeData]?) -> Void){
        AF.request("\(Urls.baseUrl)\(ParameterKey.latitude)=\(params.lat ?? 21.422510)&\(ParameterKey.longitude)=\(params.log ?? 39.826168)&\(ParameterKey.method)=\(params.method ?? 1)&\(ParameterKey.school)=\(params.school ?? 1)&\(ParameterKey.year)=\(params.year ?? 2022)&\(ParameterKey.month)=\(params.month ?? 1)", encoding: JSONEncoding.default).responseJSON { (response) in
            guard response.error == nil else {
                print(response.error!)
                completion(response.error, nil)
                return
            }
            guard let data = response.data else {
                print("didn't get any data from API")
                return
            }
            do {
                let decoder = JSONDecoder()
                let dataArray = try decoder.decode(SalaData.self, from: data).data
                completion(nil, dataArray)
            } catch let error {
                completion(error, nil)
            }
        }
    }
}
