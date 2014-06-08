//
//  AddViewController.m
//  ios-core-data-demo
//
//  Created by zlargon on 2014/6/7.
//  Copyright (c) 2014年 zlargon. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController () <UITextFieldDelegate>

@end

@implementation AddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)addItem:(id)sender {
    Beverage *beverage = [NSEntityDescription insertNewObjectForEntityForName:@"Beverage"
                                                       inManagedObjectContext:self.appDelegate.managedObjectContext];
    beverage.title =self.titleTextField.text;
    beverage.detail = self.detailTextField.text;

    // sava Beverage Core Data
    NSError* error;
    NSLog([self.appDelegate.managedObjectContext save:&error] ? @"Success" : @"Fail");

    // popup this page from navigation controller (go back to tableViewController)
    [self.navigationController popViewControllerAnimated:YES];
}

@end
