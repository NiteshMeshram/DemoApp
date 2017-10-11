//
//  UserDetails+CoreDataProperties.m
//  DemoApp
//
//  Created by Nitesh Meshram on 10/11/17.
//  Copyright © 2017 V2Solutions. All rights reserved.
//

#import "UserDetails+CoreDataProperties.h"

@implementation UserDetails (CoreDataProperties)

+ (NSFetchRequest<UserDetails *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"UserDetails"];
}

@dynamic userId;
@dynamic userName;
@dynamic message;

@end
