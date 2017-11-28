
//
//  UIViewController+Traking.m
//  runtime
//
//  Created by 张源海 on 2017/11/28.
//  Copyright © 2017年 四海八荒. All rights reserved.
//

#import "UIViewController+Traking.h"
#import <objc/runtime.h>
@implementation UIViewController (Traking)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL orginSelector = @selector(viewWillAppear:);
        SEL swizzedSelector = @selector(TrackingViewWillAppear:);
        
        Method orginMethod = class_getInstanceMethod(class, orginSelector);
        Method swizzedMethod = class_getInstanceMethod(class, swizzedSelector);
        
        BOOL didAddMethod = class_addMethod(class, orginSelector, method_getImplementation(swizzedMethod), method_getTypeEncoding(swizzedMethod));
        if (didAddMethod) {
            class_replaceMethod(class, swizzedSelector, method_getImplementation(orginMethod), method_getTypeEncoding(orginMethod));
        }else{
            method_exchangeImplementations(orginMethod, swizzedMethod);
        }
    });
}

- (void)TrackingViewWillAppear:(BOOL)animated{
    [self TrackingViewWillAppear:animated];
    NSLog(@"TrackingViewWillAppear:%@",self);
}


@end
