//
//  ViewController.swift
//  FortunesApp
//
//  Created by 田内　翔太郎 on 2019/08/07.
//  Copyright © 2019 田内　翔太郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 占い結果に必要なパラメータ
    // 年/月/日
    @IBOutlet weak var datePicker: UIDatePicker!
    // 血液型
    @IBOutlet weak var yourBloodType: UISegmentedControl!
    // スライダー
    @IBOutlet weak var sliderValue: UISlider!
    
    // ラベル系
    // スライダーの値を表示させるラベル
    @IBOutlet weak var sliderValueLabel: UILabel!
    // 占い結果を表示させるtextView
    @IBOutlet weak var resultView: UITextView!
    
    // 占いの表示内容を決定するための変数
    // 生年月日の年
    var year: Int = 0
    // 生年月日の月
    var month: Int = 0
    // 生年月日の日
    var day: Int = 0
    // 血液型
    var bloodIndex: Int = 0
    // 好きな数字
    var favNum: Int = 0
    
    // 占い結果の文言
    // 「年」によって決まる文言
    let yearResult: [String] = [     // 年を4で割った時のあまりで判定
    "春の",
    "夏の",
    "秋の",
    "冬の"
    ]
    // 「月」によって決まる文言
    let monthResult: [String] = [ // 月を3で割った時のあまりで判定
    "海に",
    "山に",
    "川に"
    ]
    // 「日」によって決まる文言
    let dayResult: [String] = [ // 日を4で割った時の余りで判定
    "愛されています。\n",
    "好まれています。\n",
    "嫌われています。\n",
    "憎まれています。\n"
    ]
    // 「血液型」によって決まる文言
    let bloodResult: [String] = [ // 血液型のボタンのIndex情報で判定
    "神経がこまやかで、人の気持ちを敏感に感じとることができます。\n",
    "他人の思惑、常識、習慣をあまり意識せず、思うところをストレートに実行することができます。\n",
    "精神性が強く、夢や希望をいつまでも追い続けることができます。\n",
    "警戒心が強いが、気心の知れた間柄になると、めんどうみがよくなることがあります。\n"
    ]
    // 「好きな数字」によって決まる文言
    let sliderResult: [String] = [ // スライダーの値を4で割った時のあまりで判断
    "また、あなたはリーダーとしての素質を持ち、人を惹きつける魅力のあるオンリーワンの存在になる可能性を秘めています。",
    "また、あなたは愛すること、やさしさ、知性や協調性のの高さが特徴で、争いを好まない優しい性格で誰からも好かれ、信頼されます。",
    "また、あなたは生命力に溢れ、エネルギッシュに人生を切り開いていく力を持っています。エリートコースを歩む人が多いのが特徴です。",
    "また、あなたはまじめにコツコツと努力を積み重ね、最終的にはすばらしい結果を残し成功する大器晩成型である可能性が高いです。"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // スライダーが動くごとに呼び出される処理
    @IBAction func moveSlider(_ sender: UISlider) {
        sliderValueLabel.text = String(Int(sliderValue.value)) // ラベルに0~100で表示させる
    }
    
    // 「占う」ボタン
    @IBAction func startFortune(_ sender: Any) {
        
        // 占い結果のtextViewを初期化
        resultView.text = ""
        
        // 以下パラメータの取得
        // 年/月/日それぞれを取得
        year = datePicker.calendar.component(.year, from: datePicker.date)
        month = datePicker.calendar.component(.month, from: datePicker.date)
        day = datePicker.calendar.component(.day, from: datePicker.date)
        
        // 血液型を取得(0: A型, 1: B型, 2: O型, 3: AB型)
        bloodIndex = yourBloodType.selectedSegmentIndex
        
        // スライドバーの値を取得
        favNum = Int(sliderValue.value)
        
        // 以下パラメータの加工
        // 各パラメータを4or3で割った余りで、表示する内容を決定する
        year %= 4 // 4種類
        month %= 3 // 3種類
        day %= 4 // 4種類
        favNum %= 4 // 4種類
        
        // 以下占い結果表示部分
        anserResult(year: year, month: month, day: day, bloodType: bloodIndex, favNum: favNum)
    }
    
    /// 占い結果を表示する関数
    /// year、day、favNum: それぞれの値を4で割った時のあまり、month: ３で割った時のあまり、bloodType: セグメントコントローラのIndex情報
    func anserResult(year: Int, month: Int, day: Int, bloodType: Int, favNum: Int) {
        resultView.text = yearResult[year] + monthResult[month] + dayResult[day] + bloodResult[bloodType] + sliderResult[favNum]
    }
}

