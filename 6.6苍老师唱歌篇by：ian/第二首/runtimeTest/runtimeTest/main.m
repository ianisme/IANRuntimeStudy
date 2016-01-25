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
#import "Bird.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Bird *bird = [[Bird alloc] init];
        bird.name = @"小小鸟";
        
        ((void (*)(id, SEL))objc_msgSend)((id)bird, @selector(sing));
    }
    return 0;
}
