//
//  ViewController.swift
//  shooting
//
//  Created by ChuanChiaWei on 2024/9/26.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBOutlet weak var ship:NSImageView!
    //實作鍵盤上,下,左,右方向鍵按下事件
    //使ship隨上,下,左,右方向鍵按下而移動
    
}

