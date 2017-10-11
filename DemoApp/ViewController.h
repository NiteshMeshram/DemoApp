//
//  ViewController.h
//  DemoApp
//
//  Created by Nitesh Meshram on 10/10/17.
//  Copyright © 2017 V2Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "Message+CoreDataClass.h"
@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *chatTableView;

@end

