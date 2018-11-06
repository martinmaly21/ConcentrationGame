//
//  ConcentrationThemes.swift
//  ConcentrationGame
//
//  Created by Martin Maly on 2018-10-28.
//  Copyright © 2018 Martin Maly. All rights reserved.
//
// 

import Foundation
import UIKit


class ConcentrationThemes {

    var emojis: [[String]] = [
        ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬"],
        ["👶","🎅","🦌","🎄","🎁","☃️","🧦","❄️"],
        ["🇨🇦","🇺🇸","🇨🇳","🏴󠁧󠁢󠁥󠁮󠁧󠁿","🇫🇷","🇷🇺","🇲🇽","🇨🇿"],
        ["🍊","🍎","🍐","🍋","🍌","🍉","🍇","🍓"],
        ["🐶","🐰","🐵","🦊","🐻","🐸","🦁","🐮"],
        ["⚽️","🏀","🏈","⚾️","🎾","🏐","🏉","🎱"]
    ]
    //revealed card, titles ,background
    var colours: [[UIColor]] = [
        [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)],
        [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)],
        [#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)],
        [#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1), #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)],
        [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)],
        [#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)]
    ]
    
}
