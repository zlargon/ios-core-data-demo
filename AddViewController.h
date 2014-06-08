//
//  AddViewController.h
//  ios-core-data-demo
//
//  Created by zlargon on 2014/6/7.
//  Copyright (c) 2014年 zlargon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Beverage.h"

@class AppDelegate;

@interface AddViewController : UIViewController

@property (assign, nonatomic) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
- (IBAction)addItem:(id)sender;

@end
