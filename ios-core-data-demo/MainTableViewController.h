//
//  MainTableViewController.h
//  ios-core-data-demo
//
//  Created by zlargon on 2014/5/25.
//  Copyright (c) 2014年 zlargon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AddViewController.h"
#import "ModifyViewController.h"

@class AppDelegate;
@interface MainTableViewController : UITableViewController

@property (nonatomic, assign) AppDelegate *appDelegate;

@end
