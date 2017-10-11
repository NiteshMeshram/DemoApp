//
//  DataManager.h
//  DemoApp
//
//  Created by Nitesh Meshram on 10/11/17.
//  Copyright © 2017 V2Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Message+CoreDataClass.h"
@interface DataManager : NSObject
{
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel  *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator  *persistentStoreCoordinator;
+ (void)prepareDataStack;

-(void)saveMessageWithCompletion:(void (^)(BOOL, Message *))completion;


+ (DataManager*)sharedInstance;
- (void)saveContext;
@end
