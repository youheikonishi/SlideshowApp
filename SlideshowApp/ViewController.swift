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
    @IBAction func startButton(_ sender: Any) {
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideshow),userInfo: nil, repeats: true)
    }
    @IBAction func goButton(_ sender: Any) {
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


}

