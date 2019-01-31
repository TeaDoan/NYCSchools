//
//  School.swift
//  20190130-KellyDoan-NYCSchools
//
//  Created by Thao Doan on 1/30/19.
//  Copyright © 2019 Thao Doan. All rights reserved.
//

import Foundation

struct School {
    
    enum CodingKeys: String, CodingKey {
        case schoolName = "school_name"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case numOfSatTestTakers = "num_of_sat_test_takers"
    }
    
    let schoolName: String?
    let satMathAvgScore: Int?
    let satWritingAvgScore: Int?
    let satCriticalReadingAvgScore: Int?
    let numOfSatTestTakers: Int?
    
}

extension School: Decodable {
    
    /*
     Values should be returned from the API as string representations of integers.
     In certain cases, these strings are not representations integers, and will be set to nil.
     */
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        schoolName = try values.decodeIfPresent(String.self, forKey: .schoolName)
        guard let mathAvg = try values.decodeIfPresent(String.self, forKey: .satMathAvgScore) else {
            throw DecodingError.dataCorrupted(.init(codingPath: [CodingKeys.satMathAvgScore], debugDescription: "Expecting string representation of Int"))
        }
        satMathAvgScore = Int(mathAvg)
        guard let writingAvg = try values.decodeIfPresent(String.self, forKey: .satWritingAvgScore) else {
            throw DecodingError.dataCorrupted(.init(codingPath: [CodingKeys.satWritingAvgScore], debugDescription: "Expecting string representation of Int"))
        }
        satWritingAvgScore = Int(writingAvg)
        guard let readingAvg = try values.decodeIfPresent(String.self, forKey: .satCriticalReadingAvgScore) else {
            throw DecodingError.dataCorrupted(.init(codingPath: [CodingKeys.satCriticalReadingAvgScore], debugDescription: "Expecting string representation of Int"))
        }
        satCriticalReadingAvgScore = Int(readingAvg)
        guard let numTakers = try values.decodeIfPresent(String.self, forKey: .numOfSatTestTakers) else {
            throw DecodingError.dataCorrupted(.init(codingPath: [CodingKeys.numOfSatTestTakers], debugDescription: "Expecting string representation of Int"))
        }
        numOfSatTestTakers = Int(numTakers)
    }
    
}
