//
//  NSObject+AGi18n.m
//  AGi18n
//
//  Created by Angel Garcia on 3/17/13.
//  Copyright (c) 2013 angelolloqui.com. All rights reserved.
//

#import "NSObject+AGi18n.h"
#import <objc/runtime.h>

@implementation NSObject (AGi18n)

//By default do nothing when localizing
- (void)localizeFromNib {
}


#pragma mark - Method swizzling

+ (void)load {
    Method awakeFromNibOriginal = class_getInstanceMethod(self, @selector(awakeFromNib));
    Method awakeFromNibCustom = class_getInstanceMethod(self, @selector(awakeFromNibCustom));
        
    //Swizzle methods
    method_exchangeImplementations(awakeFromNibOriginal, awakeFromNibCustom);
}

- (void)awakeFromNibCustom {
    //Call standard methods
    [self awakeFromNibCustom];
    
    //Localize
    [self localizeFromNib];
}

@end
