//
//  Internals.swift
//  MenuItemKit
//
//  Created by CHEN Xian’an on 1/17/16.
//  Copyright © 2016 lazyapps. All rights reserved.
//

import ObjectiveC.runtime

let imageItemIdetifier = "\u{FEFF}\u{200B}"

let blockIdentifierPrefix = "_menuitemkit_block_"

func setNewIMPWithBlock<T>(_ block: T, forSelector selector: Selector, toClass klass: AnyClass) {
  let method = class_getInstanceMethod(klass, selector)
  let imp = imp_implementationWithBlock(unsafeBitCast(block, to: AnyObject.self))
  if !class_addMethod(klass, selector, imp, method_getTypeEncoding(method)) {
    method_setImplementation(method, imp)
  }
}

func isMenuItemKitSelector(_ str: String) -> Bool {
  return str.hasPrefix(blockIdentifierPrefix)
}

func isMenuItemKitSelector(_ sel: Selector) -> Bool {
  return isMenuItemKitSelector(NSStringFromSelector(sel))
}
