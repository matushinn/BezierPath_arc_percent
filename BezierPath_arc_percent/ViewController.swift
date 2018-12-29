//
//  ViewController.swift
//  BezierPath_arc_percent
//
//  Created by 大江祥太郎 on 2018/12/29.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //パーセントの円弧のパスを作る
    func arcPercent(_ radius:CGFloat, _ percent:Double) -> UIBezierPath {
        //パーセントの最終角度に換算します
        let endAngle = 2*Double.pi*percent/100-Double.pi/2
        
        let path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: radius, startAngle: CGFloat(-Double.pi/2), endAngle: CGFloat(endAngle), clockwise: percent > 0
        )
        return path
    }
    func drawLine() -> UIImage {
        //イメージ処理の開始
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        let percent = 74.9
        //円弧のパスを作る
        UIColor.red.setStroke()
        let arcpath = arcPercent(80, Double(percent))
        arcpath.lineWidth = 60
        arcpath.lineCapStyle = .butt
        //パスを平行移動する
        let tf = CGAffineTransform(translationX: view.center.x, y: view.center.y)
        arcpath.apply(tf)
        //円弧を描画
        arcpath.stroke()
        
        //『何パーセント』の数字を書く
        let font = UIFont.boldSystemFont(ofSize: 28)
        let textFontAttributes = [NSAttributedString.Key.font:font,NSAttributedString.Key.foregroundColor:UIColor.gray]
        let drawString = String(percent) + "%"
        let posX = view.center.x-45
        let posY = view.center.y-15
        let rect = CGRect(x: posX, y: posY, width: 90, height: 30)
        //テキストを描く
        drawString.draw(in:rect,withAttributes:textFontAttributes)
        
        //イメージコンテキストからUIImageを作る
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //イメージ処理の終了
        UIGraphicsEndImageContext()
        
        return image!
      
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //図形のイメージを作る
        let drawImage = drawLine()
        //イメージビューに設定する
        let drawView = UIImageView(image: drawImage)
        //画面に表示する
        view.addSubview(drawView)
        
    }
    
    
}

