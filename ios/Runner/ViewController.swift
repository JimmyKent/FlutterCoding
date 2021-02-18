//
//  ViewController.swift

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let addView = UIView(frame:CGRect(x:100, y:350, width:200, height:50))
        addView.backgroundColor = UIColor.purple
        let tap = UITapGestureRecognizer(target: self, action:#selector(tapClick(sender:)))
        addView.addGestureRecognizer(tap)
        addView.isUserInteractionEnabled = true
        
        self.view.addSubview(addView)
        
    }
    
    @objc func tapClick(sender: UIGestureRecognizer) {
    // / 打开首页main
        FlutterBoostPlugin.open("first", urlParams:[kPageCallBackId:"MycallbackId#1"], exts: ["animated":true], onPageFinished: { (_ result:Any?) in
            print(String(format:"call me when page finished, and your result is:%@", result as! CVarArg))
        }) { (f:Bool) in
            print(String(format:"page is opened"))
        }
    }
    
    @IBAction func onClickPresentFlutterPage(_ sender: UIButton, forEvent event: UIEvent) {
        FlutterBoostPlugin.present("second", urlParams:[kPageCallBackId:"MycallbackId#2"], exts: ["animated":true], onPageFinished: { (_ result:Any?) in
            print(String(format:"call me when page finished, and your result is:%@", result as! CVarArg));
        }) { (f:Bool) in
            print(String(format:"page is presented"));
        }
    }
}

