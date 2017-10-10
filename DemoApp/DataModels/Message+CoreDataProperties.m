//
//  Message+CoreDataProperties.m
//  DemoApp
//
//  Created by Nitesh Meshram on 10/10/17.
//  Copyright © 2017 V2Solutions. All rights reserved.
//

#import "Message+CoreDataProperties.h"

@implementation Message (CoreDataProperties)

+ (NSFetchRequest<Message *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Message"];
}

@dynamic id;
@dynamic messageDescription;
@dynamic dateTime;
@dynamic senderId;
@dynamic receiverId;
@dynamic user;

@end
