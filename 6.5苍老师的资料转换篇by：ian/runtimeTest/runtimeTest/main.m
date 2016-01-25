//
//  main.m
//  runtimeTest
//
//  Created by ian on 16/1/21.
//  Copyright © 2016年 ian. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

#import "People.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDictionary *dict = @{
                               @"name" : @"苍井空",
                               @"age"  : @18,
                               @"occupation" : @"老师",
                               @"nationality" : @"日本"
                               };
        
        // 字典转模型
        People *cangTeacher = [[People alloc] initWithDictionary:dict];
        NSLog(@"热烈欢迎，从%@远道而来的%@岁的%@%@",cangTeacher.nationality,cangTeacher.age,cangTeacher.name,cangTeacher.occupation);
        
        // 模型转字典
        NSDictionary *covertedDict = [cangTeacher covertToDictionary];
        NSLog(@"%@",covertedDict);

    }
    return 0;
}
