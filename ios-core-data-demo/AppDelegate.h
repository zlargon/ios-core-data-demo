//
//  AppDelegate.h
//  ios-core-data-demo
//
//  Created by zlargon on 2014/5/25.
//  Copyright (c) 2014年 zlargon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableViewController.h"
#import "Beverage.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) UINavigationController* navigationController;
@property (strong, nonatomic) NSMutableArray* tableList;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void) loadDataFromCoreData;

@end
