//
//  BNRColorDescription.m
//  ColorBoard
//
//  Created by jfl913 on 15/2/17.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "BNRColorDescription.h"

@implementation BNRColorDescription

- (instancetype)init
{
    self = [super init];
    if (self) {
        _color = [UIColor colorWithRed:0 green:0 blue:1 alpha:1.0];
        _name = @"Blue";
    }
    return self;
}

@end
