//
//  ViewController.m
//  DemoApp
//
//  Created by Nitesh Meshram on 10/10/17.
//  Copyright © 2017 V2Solutions. All rights reserved.
//

#import "ViewController.h"
#import "ChatTableViewCell.h"
@interface ViewController ()

@end

@implementation ViewController
NSArray *tableData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        tableData = [NSArray arrayWithObjects:@"Egg Benedict", @" Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto  Mushroom Risotto ", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
    self.title = @"Demo App";
    
    [self.chatTableView registerNib:[UINib nibWithNibName:@"ChatTableViewCell" bundle:nil] forCellReuseIdentifier:@"ChatTableViewCell"];
    
    self.chatTableView.rowHeight = UITableViewAutomaticDimension;
    self.chatTableView.estimatedRowHeight = 50;
    
//    Message *objMessag = [[Message alloc] init];
    
//    objMessag.messageDescription = @"Hello 1st Message";
//    [objMessag setMessageDescription:@"Hello 1st Message"];
    

    
    [[DataManager sharedInstance] saveMessageWithCompletion:^(BOOL b, Message *msg) {
        NSLog(@"Data Saved in DB");
    }];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ChatTableViewCell"];
    
    if (!cell)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ChatTableViewCell"];
    }
    cell.messageDesc.text = [tableData objectAtIndex:indexPath.row];
    if (indexPath.row % 2) {
        [cell setUserStyle:userStyleSender];
    }
    else{
        [cell setUserStyle:userStyleReceiver];
    }
    
     return cell;
}



@end
