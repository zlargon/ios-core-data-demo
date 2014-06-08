//
//  ModifyViewController.h
//  ios-core-data-demo
//
//  Created by zlargon on 2014/6/7.
//  Copyright (c) 2014年 zlargon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModifyViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
- (IBAction)modifyItem:(id)sender;

@end
