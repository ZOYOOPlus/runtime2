//
//  MyObject.h
//  runtime
//
//  Created by 张源海 on 2017/11/28.
//  Copyright © 2017年 四海八荒. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyObject : NSObject
@property(strong,nonatomic) NSString *string;
@property(strong,nonatomic) NSArray  *array;

- (void)method1;
- (void)method2;
- (void)classMethod1;
@end
