//
//  UINavigationItem+AGi18n.m
//  AGi18n
//
//  Created by Angel Garcia on 3/17/13.
//  Copyright (c) 2013 angelolloqui.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+AGi18n.h"

@implementation UINavigationItem (AGi18n)

- (void)localizeFromNib {
    //Replace text with localizable version
    if (self.title.length > 0) {
        self.title = [[NSBundle mainBundle] localizedStringForKey:self.title value:@"" table:self.AGi18nTableName];
    }
    if (self.prompt.length > 0) {
        self.prompt = [[NSBundle mainBundle] localizedStringForKey:self.prompt value:@"" table:self.AGi18nTableName];
    }
}

@end
