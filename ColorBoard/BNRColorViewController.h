//
//  BNRColorViewController.h
//  ColorBoard
//
//  Created by jfl913 on 15/2/17.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNRColorDescription.h"

@interface BNRColorViewController : UIViewController

@property (nonatomic) BOOL existingColor;
@property (nonatomic, strong) BNRColorDescription *colorDescription;


@end
