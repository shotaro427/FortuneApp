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
    @IBOutlet weak var bloodType: UISegmentedControl!
    // スライダー
    @IBOutlet weak var sliderValue: UISlider!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // スライダーが動くごとに呼び出される処理
    @IBAction func moveSlider(_ sender: UISlider) {
        sliderValueLabel.text = String(Int(ceil(sliderValue.value))) // ラベルに0~100をで表示させる
    }
    
    // 「占う」ボタン
    @IBAction func startFortune(_ sender: Any) {
        
        // 以下パラメータの取得
        // datePickerからdate型の値を取得
        let date = datePicker.date
        // 年/月/日それぞれを取得
        year = datePicker.calendar.component(.year, from: date)
        month = datePicker.calendar.component(.month, from: date)
        day = datePicker.calendar.component(.day, from: date)
        
        // 血液型を取得(0: A型, 1: B型, 2: O型, 3: AB型)
        bloodIndex = bloodType.selectedSegmentIndex
        
        // スライドバーの値を取得
        favNum = Int(ceil(sliderValue.value))
        
        // 以下パラメータの加工
        // 各パラメータを4or3で割った余りで、表示する内容を決定する
        year %= 4 // 4種類
        month %= 3 // 3種類
        day %= 4 // 4種類
        favNum %= 4 // 4種類
        
        // 以下占い結果表示部分
        // 「年」パラメータから占い結果を決定
        switch year {
        case 0:
            resultView.text += resultYear[year]
        case 1:
            resultView.text += resultYear[year]
        case 2:
            resultView.text += resultYear[year]
        case 3:
            resultView.text += resultYear[year]
        default:
            break
        }
        
        // 「月」パラメータから占い結果を決定
        switch month {
        case 0:
            resultView.text += resultMonth[month]
        case 1:
            resultView.text += resultMonth[month]
        case 2:
            resultView.text += resultMonth[month]
        default:
            break
        }
        
        // 「日」パラメータから占い結果を決定
        switch day {
        case 0:
            resultView.text += resultDay[day]
        case 1:
            resultView.text += resultDay[day]
        case 2:
            resultView.text += resultDay[day]
        case 3:
            resultView.text += resultDay[day]
        default:
            break
        }
        
        // 血液型から占い結果を決定
        switch bloodIndex {
        case 0:
            resultView.text += resultBlood[bloodIndex]
        case 1:
            resultView.text += resultBlood[bloodIndex]
        case 2:
            resultView.text += resultBlood[bloodIndex]
        case 3:
            resultView.text += resultBlood[bloodIndex]
        default:
            break
        }
        
        // 好きな値から占い結果を決定
        switch favNum {
        case 0:
            resultView.text += resultNumber[favNum]
        case 1:
            resultView.text += resultNumber[favNum]
        case 2:
            resultView.text += resultNumber[favNum]
        case 3:
            resultView.text += resultNumber[favNum]
        default:
            break
        }
    }
    
}

