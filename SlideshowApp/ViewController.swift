//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 小西洋平 on 2017/03/03.
//  Copyright © 2017年 youhei.konishi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var suu = 1
    var timer: Timer!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var go: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = UIImage(named: "ダウンロード\(suu).jpeg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButton(_ sender: Any) {
        suu -= 1
        if suu <= 0 {
            suu = 3
        }
        imageView.image = UIImage(named: "ダウンロード\(suu).jpeg")
    }
    @IBAction func startButton(_ sender: UIButton) {
        if self.timer == nil{
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideshow),userInfo: nil, repeats: true)
            sender.setTitle("停止",for: .normal)
            back.isEnabled = false
            go.isEnabled = false
        }
            else{
                self.timer.invalidate()
                sender.setTitle("再生",for: .normal)
                sender.isEnabled = true
                back.isEnabled = true
                go.isEnabled = true
                self.timer = nil
        }
        
    }
    @IBAction func goButton(_ sender: UIButton) {
        suu += 1
        if suu >= 4 {
            suu = 1
        }
        
        imageView.image = UIImage(named: "ダウンロード\(suu).jpeg")
    }
    func slideshow(timer: Timer){
        suu += 1
        if suu >= 4{
            suu = 1
        }
        imageView.image = UIImage(named: "ダウンロード\(suu).jpeg")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController: ResultViewController = segue.destination as! ResultViewController
        resultViewController.image = UIImage(named: "ダウンロード\(suu).jpeg")
        self.timer.invalidate()
    }
    @IBAction func onTapImage(_ sender: Any) {
        performSegue(withIdentifier: "toResultViewController", sender: nil)
    }
    @IBAction func unwind(segue: UIStoryboardSegue){
    
    }
}

