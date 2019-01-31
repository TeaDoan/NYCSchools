//
//  _0190130_KellyDoan_NYCSchoolsTests.swift
//  20190130-KellyDoan-NYCSchoolsTests
//
//  Created by Thao Doan on 1/30/19.
//  Copyright © 2019 Thao Doan. All rights reserved.
//

import XCTest


class _0190130_KellyDoan_NYCSchoolsTests: XCTestCase {

    func testSchoolDecodesCorrectly() throws {

        let schoolName = "Foo"
        let satMathAvgScore = 701
        let satWritingAvgScore = 702
        let satCriticalReadingAvgScore = 703
        let numOfSatTestTakers = 100
        
        let jsonDict = [
            "school_name": schoolName,
            "sat_math_avg_score": "\(satMathAvgScore)",
            "sat_writing_avg_score": "\(satWritingAvgScore)",
            "sat_critical_reading_avg_score": "\(satCriticalReadingAvgScore)",
            "num_of_sat_test_takers": "\(numOfSatTestTakers)"
        ]
        
        let data = try JSONSerialization.data(withJSONObject: jsonDict, options: .prettyPrinted)
        let school = try JSONDecoder().decode(School.self, from: data)
        
        XCTAssertEqual(school.schoolName, schoolName)
        XCTAssertEqual(school.satMathAvgScore, satMathAvgScore)
        XCTAssertEqual(school.satWritingAvgScore, satWritingAvgScore)
        XCTAssertEqual(school.satCriticalReadingAvgScore, satCriticalReadingAvgScore)
        XCTAssertEqual(school.numOfSatTestTakers, numOfSatTestTakers)
    }

}
