//
//  ApiResult.swift
//  APIApp
//
//  Created by Vu Duy on 13/07/2021.
//

import Foundation
struct ApiResult: Codable{
    let countryID:String?
    let region:String?
    let event_clarity:String?
    let date_prec:String?
    let date_start:String?
    let date_end:String?
    let deaths_a:String?
    let deaths_b: String?
    let deaths_civillians:String?
    let deaths_unknow: String?
    let low: String?
    let best: String?
    let high: String?
    let is_deleted: String?
    let btn_delete: String?
    let id: String?
    let year: String?
    let active_year: String?
    let typeOfViolence: String?
    let confictViewID: String?
    let conflictName: String?
    let dyad_new_id: String?
    let dyad_name: String?
    let side_a_new_id: String?
    let gwnoa: String?
    let side_a: String?
    let side_b_new_id: String?
    let gwnob: String?
    let side_b: String?
    let numberOfSource: String?
    let sourceArticle: String?
    let sourceOffice: String?
    let sourceDate: String?
    let sourceHealine: String?
    let sourceOriginal: String?
    let where_prec: String?
    let where_coordinate: String?
    let adm_1: String?
    let adm_2: String?
    let latitude: String?
    let longtitude: String?
    let geom_wkt: String?
    let priofrid_gid: String?
    let country: String?
}
