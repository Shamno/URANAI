//
//  ViewController.swift
//  URANAI
//
//  Created by okeiosdeveloper on 2021/05/07.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var start: UIButton!

    @IBAction func tapButton(_ sender: Any) {
        let randomNum=Int.random(in:0..<10)
        let fortune=["大吉","中吉","小吉","吉","凶","大凶","今日はもう帰ろう","仕事クビになる","時給10000万円になる","焼肉が食える","仕事帰りにカツアゲされる"]
        label.text=fortune[randomNum]
    }
    
    @IBOutlet weak var Stella: UITextField!
        var pickerView: UIPickerView = UIPickerView()
        let stella=["おひつじ座","おうし座","ふたご座","かにざ","しし座","おとめ座","てんびん座","さそり座","いて座","やぎ座","みずがめ座","うお座"]
    override func viewDidLoad() {
            super.viewDidLoad()

            pickerView.delegate = self
            pickerView.dataSource = self
            pickerView.showsSelectionIndicator = true

            let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
            let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ViewController.done))
            let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(ViewController.cancel))
            toolbar.setItems([cancelItem, doneItem], animated: true)

            self.Stella.inputView = pickerView
            self.Stella.inputAccessoryView = toolbar
        }

        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return list.count
        }

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return list[row]
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.Stella.text = list[row]
        }

        func cancel() {
            self.Stella.text = ""
            self.Stella.endEditing(true)
        }

        func done() {
            self.Stella.endEditing(true)
        }

        func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
            return CGRect(x: x, y: y, width: width, height: height)
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    }
        //参考「Swiftでテキストフィールドにピッカーを設定しリスト選択する」
}

