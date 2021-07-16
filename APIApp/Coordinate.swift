//
//  Coordinate.swift
//  APIApp
//
//  Created by Vu Duy on 13/07/2021.
//

import Foundation

class Coordinate {
    static let shareInstance = Coordinate()
    var cordinates:[(latitude: Float, longitude: Float)] = []
    var selectedCoordinate: (latitude: Float, longitude: Float, isSelected: Bool) = (0, 0, false)
    var lastIndex:Int = 0;
}
