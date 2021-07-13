//
//  APIHelper.swift
//  APIApp
//
//  Created by Vu Duy on 13/07/2021.
//

import Foundation

class APIHelper{
    
    
    static func getData(limit: Int, offset: Int, completion: @escaping ([ApiResult]) -> ()){
        let url = "https://rtlab02.rtworkspace.com/api/query/datamodel?dm_name=test_ucdp_ged181&token=secret&limit=\(limit)&offset=\(offset)"
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else{
                print("Can't load data")
                return
            }
            // Have data
            var result: [ApiResult]?
            do{
                result = try JSONDecoder().decode([ApiResult].self, from: data)
            }
            catch{
                print("Error when process data \(error.localizedDescription)")
            }
            
            guard let json = result else{
                return
            }
            
            DispatchQueue.main.async { completion(json) }
        }).resume()
    }
}
