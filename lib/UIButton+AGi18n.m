//
//  UIButton+AGi18n.m
//  AGi18n
//
//  Created by Angel Garcia on 3/13/13.
//  Copyright (c) 2013 angelolloqui.com. All rights reserved.
//

#import "UIButton+AGi18n.h"

@implementation UIButton (AGi18n)

- (void)localizeFromNib {
    // Replace text with localizable version
    void (^localizeForState)(UIControlState) = ^(UIControlState state) {
        NSString *title = [self titleForState:state];
        if (title.length > 0) {
            [self setTitle:[[NSBundle mainBundle] localizedStringForKey:title value:@"" table:nil] forState:state];
        }
    };
    // Force replace for normal state
    localizeForState(UIControlStateNormal);

    NSString *normalTitle = [self titleForState:UIControlStateNormal];
    NSArray *otherStates = @[@(UIControlStateHighlighted), @(UIControlStateDisabled), @(UIControlStateSelected), @(UIControlStateApplication)];
    for (NSNumber *state in otherStates) {
        NSString *title = [self titleForState:state.unsignedIntegerValue];
        if (title.length > 0 && ![title isEqualToString:normalTitle]) {
            localizeForState(state.unsignedIntegerValue);
        }
    }
}

@end
