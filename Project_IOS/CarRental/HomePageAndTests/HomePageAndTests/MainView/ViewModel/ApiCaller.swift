//
//  ApiCaller.swift
//  HomePageAndTests
//
//  Created by marwa awwad mohamed awwad on 08/04/2024.
//

import Foundation
enum NetworkError: Error {
    case urlErrror
    case cannotParseData
    case networkFailure
}
class ApiCaller {
    func getCars(
        completionHandler: @escaping(_ result: Result<Cars, NetworkError>) -> Void){
            let urlString = NetworkConstants.shared.carsSourceLink
            guard let url = URL(string: urlString) else {
                completionHandler(.failure(NetworkError.urlErrror))
            }
            URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
                if error == nil ,
                   let data = dataResponse,
                   let resultData = try? JSONDecoder().decode(Cars.self, from: data) {
                    completionHandler(.success(resultData))
                }else {
                    
                    completionHandler(.failure(.cannotParseData))
                    
                }
            }.resume()
        }
}
