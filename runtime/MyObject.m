//
//  MyObject.m
//  runtime
//
//  Created by 张源海 on 2017/11/28.
//  Copyright © 2017年 四海八荒. All rights reserved.
//

#import "MyObject.h"
#import <objc/runtime.h>
@interface MyObject (){
    NSInteger _instance1;
    NSString  *_instance2;
}

@property(assign,nonatomic) NSInteger intrger;

- (void)method3WithArge1:(NSInteger)arge1 arge2:(NSString *)arge2;

@end
@implementation MyObject


-(void)classMethod1{
    
    
}

- (void)method1{
    NSLog(@"cell Method1");
}

- (void)method2{
    
}

- (void)method3WithArge1:(NSInteger)arge1 arge2:(NSString *)arge2{
    NSLog(@"arge1 %ld arge2 %@",arge1,arge2);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    NSString *selector = NSStringFromSelector(sel);
    if ([selector isEqualToString:@"method1"]) {
        class_addMethod(self.class, @selector(method1), (IMP)functionForMethod1, "@:");
    }
    return [super resolveInstanceMethod:sel];
}

void functionForMethod1(id self,SEL _cmd){
    NSLog(@"%@ %p",self,_cmd);
}

- (instancetype)forwardingTargetForSelector:(SEL)aSelector{
    NSString *selector = NSStringFromSelector(aSelector);
    if([selector isEqualToString:@"method2"]){
        //        return;
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    
    
}



@end
