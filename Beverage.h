//
//  Beverage.h
//  ios-core-data-demo
//
//  Created by zlargon on 2014/6/8.
//  Copyright (c) 2014年 zlargon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Beverage : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * detail;

@end
