//
//  UISegmentedControl+AGi18n.m
//  Pods
//
//  Created by Angel Garcia on 28/01/14.
//
//

#import <UIKit/UIKit.h>
#import "NSObject+AGi18n.h"

@implementation UISegmentedControl (AGi18n)

- (void)localizeFromNib {
    //Replace text with localizable version
    for (NSInteger segment = 0; segment < self.numberOfSegments; segment++) {
        NSString *title = [self titleForSegmentAtIndex:segment];
        if(title.length>0)
        {
            [self setTitle:[[NSBundle mainBundle] localizedStringForKey:title value:@"" table:self.AGi18nTableName] forSegmentAtIndex:segment];
            [self layoutIfNeeded];
        }
    }
}

@end
