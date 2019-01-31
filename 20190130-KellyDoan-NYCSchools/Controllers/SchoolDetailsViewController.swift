//
//  SchoolDetailsViewController.swift
//  20190130-KellyDoan-NYCSchools
//
//  Created by Thao Doan on 1/30/19.
//  Copyright © 2019 Thao Doan. All rights reserved.
//

import UIKit

class SchoolDetailsViewController: UIViewController {
    
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var satMathScoreLabel: UILabel!
    @IBOutlet weak var satReadingScoreLabel: UILabel!
    @IBOutlet weak var satWritingScoreLabel: UILabel!
    @IBOutlet weak var satTestTakerLabel: UILabel!
    
    var school: School?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        // if not set with data later, labels will show "Unknown"
        [schoolNameLabel, satMathScoreLabel, satReadingScoreLabel, satWritingScoreLabel, satTestTakerLabel].forEach {
            $0?.text = "Unknown"
        }
        // if data exists, set on labels
        guard let school = school else { return }
        schoolNameLabel.text = school.schoolName
        
        if let score = school.satMathAvgScore {
            satMathScoreLabel.text = String(score)
        }
        if let score = school.satCriticalReadingAvgScore {
            satReadingScoreLabel.text = String(score)
        }
        if let score = school.satWritingAvgScore {
            satWritingScoreLabel.text = String(score)
        }
        if let takers = school.numOfSatTestTakers {
            satTestTakerLabel.text = String(takers)
        }
    }

}
