//
//  Message+CoreDataProperties.h
//  DemoApp
//
//  Created by Nitesh Meshram on 10/10/17.
//  Copyright © 2017 V2Solutions. All rights reserved.
//

#import "Message+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Message (CoreDataProperties)

+ (NSFetchRequest<Message *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *id;
@property (nullable, nonatomic, copy) NSString *messageDescription;
@property (nullable, nonatomic, copy) NSString *dateTime;
@property (nullable, nonatomic, copy) NSString *senderId;
@property (nullable, nonatomic, copy) NSString *receiverId;
@property (nullable, nonatomic, retain) UserDetails *user;

@end

NS_ASSUME_NONNULL_END
