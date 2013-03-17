//
//  UISearchBar+AGi18n.m
//  AGi18n
//
//  Created by Angel Garcia on 3/17/13.
//  Copyright (c) 2013 angelolloqui.com. All rights reserved.
//

#import "UISearchBar+AGi18n.h"

@implementation UISearchBar (AGi18n)

- (void)localizeFromNib {
    //Replace text with localizable version
    if (self.text.length > 0) {
        self.text = [[NSBundle mainBundle] localizedStringForKey:self.text value:@"" table:nil];
    }
    if (self.placeholder.length > 0) {
        self.placeholder = [[NSBundle mainBundle] localizedStringForKey:self.placeholder value:@"" table:nil];
    }
    if (self.prompt.length > 0) {
        self.prompt = [[NSBundle mainBundle] localizedStringForKey:self.prompt value:@"" table:nil];
    }
}

@end
