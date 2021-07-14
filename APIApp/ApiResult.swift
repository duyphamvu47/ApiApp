//
//  ApiResult.swift
//  APIApp
//
//  Created by Vu Duy on 13/07/2021.
//

import Foundation
struct ApiResult: Codable{
    let country_id:String?
    let region:String?
    let event_clarity:String?
    let date_prec:String?
    let date_start:String?
    let date_end:String?
    let deaths_a:String?
    let deaths_b: String?
    let deaths_civilians:String?
    let deaths_unknown: String?
    let low: String?
    let best: String?
    let high: String?
    let is_deleted: String?
    let btn_delete: String?
    let id: String?
    let year: String?
    let active_year: String?
    let type_of_violence: String?
    let conflict_new_id: String?
    let conflict_name: String?
    let dyad_new_id: String?
    let dyad_name: String?
    let side_a_new_id: String?
    let gwnoa: String?
    let side_a: String?
    let side_b_new_id: String?
    let gwnob: String?
    let side_b: String?
    let number_of_sources: String?
    let source_article: String?
    let source_office: String?
    let source_date: String?
    let source_headline: String?
    let source_original: String?
    let where_prec: String?
    let where_coordinates: String?
    let adm_1: String?
    let adm_2: String?
    let latitude: String?
    let longitude: String?
    let geom_wkt: String?
    let priogrid_gid: String?
    let country: String?
}
