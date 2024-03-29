//
//  AppDelegate.swift
//  NKDelegateTest
//
//  Created by nanoka____ on 2015/07/09.
//  Copyright (c) 2015年 nanoka____. All rights reserved.
//

/*--------------------------------------------------------------------
; import : FrameworkやObjective-cを読み込む場合に使用
---------------------------------------------------------------------*/
import UIKit

@UIApplicationMain//Objective-cのmain.mを省略したもの
/*=====================================================================
; AppDelegate : 起動時に呼び出されるクラス
======================================================================*/
class AppDelegate : UIResponder, UIApplicationDelegate, NKBootControllerDelegate {
    
    var window:UIWindow? //?はnilを許容するかどうかを明示的に指定する
    
    /*-----------------------------------------------------------------
    ; didFinishLaunchingWithOptions : アプリを起動した際に呼び出される
    ;                            in : application(UIApplication)
    ;                               : launchOptions(NSDictionary?)
    ;                           out : Bool
    ------------------------------------------------------------------*/
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        //ウィンドウの生成
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        //ルートビューコントローラーの作成
        let bootController = NKBootController();
        bootController.delegate = self
        //ルートビューコントローラーの指定
        self.window!.rootViewController = bootController;
        //Windowの表示
        self.window?.makeKeyAndVisible()
        return true
    }
    
    /*-----------------------------------------------------------------
    ; didEndBootController(bootController : 起動時通信が終了した
    ;                                  in : bootController(NKBootController)
    ;                                     : flag(Bool)
    ;                                 out :
    ------------------------------------------------------------------*/
    func didEndBootController(bootController: NKBootController, flag: Bool) {
        //ウインドウの初期化
        self.window!.rootViewController = nil
        self.window = nil
        
        //ウィンドウの生成
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        //ルートビューコントローラーの作成
        let viewController = NKViewController();
        //ルートビューコントローラーの指定
        self.window!.rootViewController = viewController;
        //Windowの表示
        self.window?.makeKeyAndVisible()
    }
}

