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
