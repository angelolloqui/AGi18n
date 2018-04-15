//
//  NSObject+AGi18n.m
//  AGi18n
//
//  Created by Angel Garcia on 3/17/13.
//  Copyright (c) 2013 angelolloqui.com. All rights reserved.
//

#import "NSObject+AGi18n.h"
#import <objc/runtime.h>

#define AGI18N_USE_SWIZZLING 0

static void *AGi18nTableNameKey;

@implementation NSObject (AGi18n)

- (NSString *)AGi18nTableName {
    return objc_getAssociatedObject(self, &AGi18nTableNameKey);
}

-(void)setAGi18nTableName:(NSString *)AGi18nTableName {
    objc_setAssociatedObject(self, &AGi18nTableNameKey, AGi18nTableName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//By default do nothing when localizing
- (void)localizeFromNib {
}


#if AGI18N_USE_SWIZZLING
#pragma mark - Method swizzling

// Method swizzling seems to be broken under certain circustamces.
//https://github.com/angelolloqui/AGi18n/issues/32
// For now use a category on the NSObject.awakeFromNib instead

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

#else
#pragma mark - Override awakeFromNib

- (void)awakeFromNib {
    [self localizeFromNib];
}
#endif

@end
