//
//  ViewController.swift
//  FortunesApp
//
//  Created by 田内　翔太郎 on 2019/08/07.
//  Copyright © 2019 田内　翔太郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // スライダーの値を表示させるラベル
    @IBOutlet weak var sliderValueLabel: UILabel!
    // スライダー
    @IBOutlet weak var sliderValue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // スライダーが動くごとに呼び出される処理
    @IBAction func moveSlider(_ sender: UISlider) {
        sliderValueLabel.text = String(Int(ceil(sliderValue.value))) // ラベルに0~100をで表示させる
    }
}

