//
//  UserDetails+CoreDataProperties.h
//  DemoApp
//
//  Created by Nitesh Meshram on 10/10/17.
//  Copyright © 2017 V2Solutions. All rights reserved.
//

#import "UserDetails+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserDetails (CoreDataProperties)

+ (NSFetchRequest<UserDetails *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *userId;
@property (nullable, nonatomic, copy) NSString *userName;
@property (nullable, nonatomic, retain) Message *message;

@end

NS_ASSUME_NONNULL_END
