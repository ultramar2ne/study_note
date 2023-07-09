//
//  ViewController.swift
//  doit-maker
//
//  Created by Jinwook Choi on 2023/06/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COLUMN = 1
    var imageArray = [UIImage?]()
    var imageFileName = ["1.png","2.png","3.png"]
    
    /// var
    ///
    ///  outlet variable
    ///
    /// label : for textfield test
    @IBOutlet var uILabelTest: UILabel!
    /// textfield
    @IBOutlet var uiTextFieldTest: UITextField!
    /// label : date current
    @IBOutlet var uiLabelDateCurrent: UILabel!
    /// label : date select
    @IBOutlet var uiLabelDateSelect: UILabel!
    /// imageView
    @IBOutlet var uiImageView: UIImageView!
    /// label : for display picker item
    @IBOutlet var uiLabelPicker: UILabel!
    /// datepicket
    @IBOutlet var uiDatePickerOutlet: UIDatePicker!
    /// photoPicker
    @IBOutlet var uiPhotoPickerOutlet: UIPickerView!
    /// switch
    @IBOutlet var uiSwitchOutlet: UISwitch!
    
    /// event
    ///
    /// action variable
    ///
    /// textfield change event
    @IBAction func uiTextFieldEvent(_ sender: UITextField) {
        uILabelTest.text = sender.text
    }
    /// button event
    @IBAction func UIButtonTest(_ sender: UIButton, forEvent event: UIEvent) {
        uILabelTest.text = "나는 잘생긴 최진욱."
        uiTextFieldTest.text = ""
    }
    /// switch event
    @IBAction func uiSwitchEvent(_ sender: UISwitch) {
        if uiImageView.contentMode == UIView.ContentMode.scaleAspectFit {
            let scaleAlert = UIAlertController(title: "진짜루.", message: "진짜 확대할거야?", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "ㅇㅋ", style: UIAlertAction.Style.default, handler: {
                (action) in // 익명 함수. 매개변수를 의미함... 음...
                self.uiImageView.contentMode = UIView.ContentMode.center
            })
            let onDenyAction = UIAlertAction(title: "아늰데?", style: UIAlertAction.Style.default, handler: {
                (action) in
                sender.setOn(false, animated: true)
            })
            
            scaleAlert.addAction(onAction)
            scaleAlert.addAction(onDenyAction)
            present(scaleAlert, animated: true)
        } else {
            uiImageView.contentMode = UIView.ContentMode.scaleAspectFit
        }
    }
    
    @IBAction func uiDatePicekt(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/DD - HH:mm EEE"
        
        uiLabelDateSelect.text = formatter.string(from: datePickerView.date)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set switch
        //        uiSwitchOutlet = uiSwitchOutlet.off
        
        // set image
        uiImageView.image = UIImage(named: "resource/im_cornflower.png")
        
        // set default dateTime
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/DD - HH:mm EEE"
        uiLabelDateCurrent.text = formatter.string(from: date as Date)
        uiLabelDateSelect.text = formatter.string(from: date as Date)
        
        // set image picker array
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: "resource/picker/" + imageFileName[i])
            imageArray.append(image)
            
            uiLabelPicker.text = imageFileName[0]
        }
        
        
    }
}

/// ext for PickerDelegate
extension ViewController {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    /// title을 리턴하는거임
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        uiLabelPicker.text = imageFileName[row]
        uiImageView.image = imageArray[row]
        return imageFileName[row]
    }
    
    //    /// row 에 표시할 view를 만들 수 있음
    //    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    //
    //    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        /// 높이
        return 50
    }
}
