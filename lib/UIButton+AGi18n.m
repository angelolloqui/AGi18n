//
//  UIButton+AGi18n.m
//  SupermarketDirect
//
//  Created by Angel Garcia on 3/13/13.
//  Copyright (c) 2013 Xaton. All rights reserved.
//

#import "UIButton+AGi18n.h"
#import <objc/runtime.h>

@implementation UIButton (AGi18n)

+ (void)load {
    Method awakeFromNibParent = class_getInstanceMethod([self superclass], @selector(awakeFromNib));
    Method awakeFromNibOriginal = class_getInstanceMethod(self, @selector(awakeFromNib));
    Method awakeFromNibCustom = class_getInstanceMethod(self, @selector(awakeFromNibCustom));
    
    //Method does not exist in this class (inherited from super), so add it
    if (awakeFromNibParent == awakeFromNibOriginal) {
        class_addMethod(self, @selector(awakeFromNib), method_getImplementation(awakeFromNibParent), "v@:");
        awakeFromNibOriginal = class_getInstanceMethod(self, @selector(awakeFromNib));
    }
    
    //Swizzle methods
    method_exchangeImplementations(awakeFromNibOriginal, awakeFromNibCustom);
}


- (void)awakeFromNibCustom {
    
    //Call standard methods
    [self awakeFromNibCustom];

    //Replace text with localizable version
    NSArray *states = @[@(UIControlStateNormal), @(UIControlStateHighlighted), @(UIControlStateDisabled), @(UIControlStateSelected), @(UIControlStateApplication)];
    for (NSNumber *state in states) {
        NSString *title = [self titleForState:state.integerValue];
        if (title.length > 0) {
            [self setTitle:[[NSBundle mainBundle] localizedStringForKey:title value:@"" table:nil] forState:state.integerValue];
        }
    }
}

@end
