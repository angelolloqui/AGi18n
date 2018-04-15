//
//  NSObject+AGi18n.h
//  AGi18n
//
//  Created by Angel Garcia on 3/17/13.
//  Copyright (c) 2013 angelolloqui.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AGi18n)

@property (strong, nonatomic) IBInspectable NSString *AGi18nTableName;

- (void)localizeFromNib;

@end
