//
//  AppError.swift
//  MyProjectPractice
//
//  Created by Melinda Diaz on 12/12/19.
//  Copyright © 2019 Melinda Diaz. All rights reserved.
//

import Foundation

enum AppError: Error {
    case badUrl(String)//When you messed up on the your part
    case networkClientError(Error)//When THEIR network servers are not working
    case noResponse//no response from network
    case badStatusCode(Int)//When you get data but somehow its broken
    case decodingError(Error) // This is when our model does not coninside with the data retrieved
}
