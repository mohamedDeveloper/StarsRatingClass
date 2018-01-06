//
//  ratingStackView.swift
//  IAFUHospital
//
//  Created by Mohamed on 12/12/17.
//  Copyright © 2017 Mohamed. All rights reserved.
//

import UIKit

class RatingController: UIStackView {
    var starsRating = 0
    var starsEmptyPicName = "star" // change it to your empty star picture name
    var starsFilledPicName = "starfill" // change it to your filled star picture name
    override func draw(_ rect: CGRect) {
        let myViews = self.subviews.filter{$0 is UIButton}
        var starTag = 1
        for theView in myViews {
            if let theButton = theView as? UIButton{
                theButton.setImage(UIImage(named: starsEmptyPicName), for: .normal)
                theButton.addTarget(self, action: #selector(self.pressed(sender:)), for: .touchUpInside)
                theButton.tag = starTag
                starTag = starTag + 1
            }
        }
    }
    @objc func pressed(sender: UIButton) {
        starsRating = sender.tag
        let myViews = self.subviews.filter{$0 is UIButton}
        for theView in myViews {
            if let theButton = theView as? UIButton{
                if theButton.tag > sender.tag {
                    theButton.setImage(UIImage(named: starsEmptyPicName), for: .normal)
                }else{
                    theButton.setImage(UIImage(named: starsFilledPicName), for: .normal)
                }
            }
        }
    }
}

