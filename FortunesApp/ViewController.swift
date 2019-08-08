//
//  ViewController.swift
//  FortunesApp
//
//  Created by 田内　翔太郎 on 2019/08/07.
//  Copyright © 2019 田内　翔太郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 占い結果
    // 生年月日の「年」の情報から表示する占い結果
    let resultYear: [String] = [ // 年を4で割った時のあまりで判定
        "春の",
        "夏の",
        "秋の",
        "冬の"
    ]
    
    // 生年月日の「月」の情報から表示する占い結果
    let resultMonth: [String] = [ // 月を3で割った時のあまりで判定
        "海に",
        "山に",
        "川に"
    ]
    
    // 生年月日の「日」の情報から表示する占い結果
    let resultDay: [String] = [ // 日を4で割った時の余りで判定
        "愛されています。\n",
        "好まれています。\n",
        "嫌われています。\n",
        "憎まれています。\n"
    ]
    
    // 血液型から表示する占い結果(上から順にA/B/O/AB型)
    let resultBlood: [String] = [
        "神経がこまやかで、人の気持ちを敏感に感じとることができます。\n",
        "他人の思惑、常識、習慣をあまり意識せず、思うところをストレートに実行することができます。\n",
        "精神性が強く、夢や希望をいつまでも追い続けることができます。\n",
        "警戒心が強いが、気心の知れた間柄になると、めんどうみがよくなることがあります。\n"
    ]
    
    // 好きな値から表示する占い結果
    let resultNumber: [String] = [
        "また、あなたはリーダーとしての素質を持ち、人を惹きつける魅力のあるオンリーワンの存在になる可能性を秘めています。",
        "また、あなたは愛すること、やさしさ、知性や協調性のの高さが特徴で、争いを好まない優しい性格で誰からも好かれ、信頼されます。",
        "また、あなたは生命力に溢れ、エネルギッシュに人生を切り開いていく力を持っています。エリートコースを歩む人が多いのが特徴です。",
        "また、あなたはまじめにコツコツと努力を積み重ね、最終的にはすばらしい結果を残し成功する大器晩成型である可能性が高いです。"
    ]


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

