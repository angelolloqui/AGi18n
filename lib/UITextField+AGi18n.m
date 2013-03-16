//
//  UITextField+AGi18n.m
//  SupermarketDirect
//
//  Created by Angel Garcia on 3/13/13.
//  Copyright (c) 2013 Xaton. All rights reserved.
//

#import "UITextField+AGi18n.h"
#import <objc/runtime.h>

@implementation UITextField (AGi18n)

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
    if (self.text.length > 0) {
        self.text = [[NSBundle mainBundle] localizedStringForKey:self.text value:@"" table:nil];
    }
    if (self.placeholder.length > 0) {
        self.placeholder = [[NSBundle mainBundle] localizedStringForKey:self.placeholder value:@"" table:nil];
    }
}

@end
