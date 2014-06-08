//
//  MainTableViewController.m
//  ios-core-data-demo
//
//  Created by zlargon on 2014/5/25.
//  Copyright (c) 2014年 zlargon. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // load data
    [self.appDelegate loadDataFromCoreData];

    // update UI
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    // create add button
    UIButton* addButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [addButton addTarget:self
                  action:@selector(gotoAddViewController:)
        forControlEvents:UIControlEventTouchUpInside];

    // put 'add button' to navigation left button
    UIBarButtonItem* leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1; // only one section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.appDelegate.tableList.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Beverage"; // only one section
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];

    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle
                                      reuseIdentifier: @"myCell"];
    }

    cell.imageView.image = [UIImage imageNamed:@"leaf_icon"];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

    // get beverage from appDelegate
    Beverage *beverage = self.appDelegate.tableList[indexPath.row];
    cell.textLabel.text = beverage.title;
    cell.detailTextLabel.text = beverage.detail;

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Delete
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        // 1. Delete the row from database (CoreData)
        Beverage *beverage = self.appDelegate.tableList[indexPath.row];
        [self.appDelegate.managedObjectContext deleteObject:beverage];

        // check the result
        NSError *error = nil;
        if ([self.appDelegate.managedObjectContext save:&error] == NO) {
            NSLog(@"Delete Beverage Failure");
            return;
        }

        // 2. Delete the row from memory (appDelegate.tableList)
        [self.appDelegate.tableList removeObjectAtIndex:indexPath.row];

        // 3. Delete the row from UI (table view controller)
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        return;
    }

    // Insert
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        return;
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    ModifyViewController *modifyViewController = [[ModifyViewController alloc] initWithNibName:@"ModifyViewController"
                                                                                        bundle:nil];

    // Pass the selected object to the new view controller.
    modifyViewController.title = @"Modify";
    modifyViewController.currentBeverage = self.appDelegate.tableList[indexPath.row];

    // Push the view controller.
    [self.navigationController pushViewController:modifyViewController animated:YES];
}

- (void)gotoAddViewController:(id)sender
{
    AddViewController *addViewController = [[AddViewController alloc] initWithNibName:@"AddViewController"
                                                                               bundle:nil];
    [self.navigationController pushViewController:addViewController animated:YES];
}

@end
