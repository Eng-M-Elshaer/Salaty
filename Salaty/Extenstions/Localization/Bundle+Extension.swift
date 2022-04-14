//
//  Bundle+Extension.swift
//  ZulaApp
//
//  Created by Ibrahim El-geddawy on 10/06/2021.
//  Copyright © 2021 ahmedbahnasy. All rights reserved.
//

import Foundation
var associatedLanguageBundle = 0;

class PrivateBundle: Bundle {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        
        let bundle = objc_getAssociatedObject(self, &associatedLanguageBundle) as? Bundle
        
        return bundle != nil ? (bundle?.localizedString(forKey: key, value: value, table: tableName))! :
            super.localizedString(forKey: key, value: value, table: tableName)
    }
}

extension Bundle {
    class func setLanguage(language:String)
    {
        DispatchQueue.once {
            object_setClass(main,PrivateBundle.classForCoder());
        }
        
        var bundle = Bundle();
        if let _path = Bundle.main.path(forResource: language, ofType: "lproj") {
            bundle = Bundle(path: _path)!
        } else {
            let _path = Bundle.main.path(forResource: "Base", ofType: "lproj")!
            bundle = Bundle(path: _path)!
        }
        
        objc_setAssociatedObject(main, &associatedLanguageBundle,
                                 language != "" ?
                                    bundle : nil
            , objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
}

public extension DispatchQueue {
    private static var _onceTracker = [String]()
    
    class func once(file: String = #file, function: String = #function, line: Int = #line, block:()->Void) {
        let token = file + ":" + function + ":" + String(line)
        once(token: token, block: block)
    }
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
     - parameter block: Block to execute once
     */
    class func once(token: String, block:()->Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
    }
}

