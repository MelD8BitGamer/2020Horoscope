//
//  NetworkHelper.swift
//  MyProjectPractice
//
//  Created by Melinda Diaz on 12/12/19.
//  Copyright © 2019 Melinda Diaz. All rights reserved.
//

import Foundation


struct NetworkHelper {
    
    static let shared = NetworkHelper()
    //this is calling and initializing itself
    
    private var session: URLSession
    //this is what gives you access to the data on the internet (upload and download)
    
    //this is private for security reasons
    private init() {
        session = URLSession(configuration: .default)//it is a basic default configuration
    }

//completion handler has a set of instructions that has to complete. //Error is a basic errortype that Swift provides us. You can customize your own Error type
    func getDataTask(url: String, completionHandler: @escaping (Result<Data,AppError>) ->()) {
        
        guard let urlConversion = URL(string: url) else {
            return
        }
        
    }
}
