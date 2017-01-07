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
    
    NSString *localizedNormalTitle = nil;
    NSAttributedString *localizedNormalAttributedTitle = nil;
    //Replace text with localizable version
    NSArray *states = @[@(UIControlStateNormal), @(UIControlStateHighlighted), @(UIControlStateDisabled), @(UIControlStateSelected), @(UIControlStateApplication)];
    for (NSNumber *state in states) {
        UIControlState s = state.integerValue;
        NSString *title = [self titleForState:s];
        if (title.length > 0 && ![title isEqualToString:localizedNormalTitle]) {
            NSString *locTitle = [[NSBundle mainBundle] localizedStringForKey:title value:@"" table:nil];
            if (s == UIControlStateNormal)
                localizedNormalTitle = locTitle;
            [self setTitle:locTitle forState:s];
        }
        
        NSAttributedString *attrTitle = [self attributedTitleForState:s];
        title = attrTitle.string;
        if (title.length > 0 && ![attrTitle isEqualToAttributedString:localizedNormalAttributedTitle]) {
            NSMutableAttributedString *locAttrTitle = [attrTitle mutableCopy];
            [locAttrTitle replaceCharactersInRange:NSMakeRange(0, title.length) withString:[[NSBundle mainBundle] localizedStringForKey:title value:@"" table:nil]];
            if (s == UIControlStateNormal)
                localizedNormalAttributedTitle = locAttrTitle;
            [self setAttributedTitle:locAttrTitle forState:s];
        }
    }
}

@end
