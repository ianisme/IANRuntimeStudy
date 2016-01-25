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
        
        People *cangTeacher = [[People alloc] init];
        cangTeacher.name = @"苍井空";
        cangTeacher.age = @18;
        cangTeacher.occupation = @"老师";
        cangTeacher.nationality = @"日本";
        
        NSString *path = NSHomeDirectory();
        path = [NSString stringWithFormat:@"%@/cangTeacher",path];
        // 归档
        [NSKeyedArchiver archiveRootObject:cangTeacher toFile:path];
        // 解归档
        People *teacher = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        NSLog(@"热烈欢迎，从%@远道而来的%@岁的%@%@",teacher.nationality,teacher.age,teacher.name,teacher.occupation);
    }
    return 0;
}
