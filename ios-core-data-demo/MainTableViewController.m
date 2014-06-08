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

    // init title list
    self.titleList = @[
        @"iPhone Family",
        @"iPod Family",
        @"iPad Family"
    ].mutableCopy;

    // init table list
    self.tableList = @[
        @[@"Iphone5C", @"Iphone5S"],
        @[@"IPod32", @"IPod64", @"IPod128", @"IPod mini"],
        @[@"IPad air", @"IPad mini"]
    ].mutableCopy;
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
    return [self.titleList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.tableList[section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.titleList[section];
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
    cell.textLabel.text = self.tableList[indexPath.section][indexPath.row];
    cell.detailTextLabel.text = @"detail information...";
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

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

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
*/

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
