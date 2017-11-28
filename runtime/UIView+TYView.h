//
//  UIView+TYView.h
//  runtime
//
//  Created by 张源海 on 2017/11/28.
//  Copyright © 2017年 四海八荒. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TYView)
- (void)setTapActionWithBlock:(void (^)(void))block;
@end
