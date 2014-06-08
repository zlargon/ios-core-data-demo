//
//  ModifyViewController.m
//  ios-core-data-demo
//
//  Created by zlargon on 2014/6/7.
//  Copyright (c) 2014年 zlargon. All rights reserved.
//

#import "ModifyViewController.h"

@interface ModifyViewController ()

@end

@implementation ModifyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // setup current beverage title and detail passed by MainViewController
    self.titleTextField.text = self.currentBeverage.title;
    self.detailTextField.text = self.currentBeverage.detail;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    // setup text field delegate
    self.titleTextField.delegate = self;
    self.detailTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)modifyItem:(id)sender
{
    self.currentBeverage.title = self.titleTextField.text;
    self.currentBeverage.detail = self.detailTextField.text;

    // sava Beverage CoreData
    NSError *error = nil;
    NSLog([self.appDelegate.managedObjectContext save:&error] ? @"Success" : @"Fail");

    // popup this page from navigation controller (go back to MainTableViewController)
    [self.navigationController popViewControllerAnimated:YES];
}

@end
