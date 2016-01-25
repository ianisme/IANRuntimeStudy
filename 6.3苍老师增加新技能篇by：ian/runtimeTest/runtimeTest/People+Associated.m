//
//  People+Associated.m
//  runtimeTest
//
//  Created by ian on 16/1/22.
//  Copyright © 2016年 ian. All rights reserved.
//

#import "People+Associated.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation People (Associated)

- (void)setAssociatedBust:(NSNumber *)bust
{
    // 设置关联对象
    objc_setAssociatedObject(self, @selector(associatedBust), bust, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSNumber *)associatedBust
{
    // 得到关联对象
    return objc_getAssociatedObject(self, @selector(associatedBust));
}

- (void)setAssociatedCallBack:(CodingCallBack)callback {
    objc_setAssociatedObject(self, @selector(associatedCallBack), callback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CodingCallBack)associatedCallBack {
    return objc_getAssociatedObject(self, @selector(associatedCallBack));
}

@end
