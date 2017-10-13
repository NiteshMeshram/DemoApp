//
//  ViewController.m
//  DemoApp
//
//  Created by Nitesh Meshram on 10/10/17.
//  Copyright © 2017 V2Solutions. All rights reserved.
//

#import "ViewController.h"
#import "ChatTableViewCell.h"
#include <stdlib.h>
@interface ViewController ()

@end

@implementation ViewController
NSArray *tableData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        tableData = [NSArray arrayWithObjects:@"Hi",
                     @" How are you?",
                     @"What's going on.",
                     @"I am good",
                     @"Weekend started",
                     @"I am going to wath FIFA",
                     @"White Chocolate Donut",
                     @"Starbucks Coffee",
                     @"Vegetable Curry",
                     @"Instant Noodle with Egg",
                     @"Noodle with BBQ Pork",
                     @"Japanese Noodle with Pork",
                     @"Green Tea",
                     @"Thai Shrimp Cake",
                     @"Angry Birds Cake",
                     @"Ham and Cheese Panini", nil];
    
    self.title = @"Demo App";
    
    [self.chatTableView registerNib:[UINib nibWithNibName:@"ChatTableViewCell" bundle:nil] forCellReuseIdentifier:@"ChatTableViewCell"];
    
    self.chatTableView.rowHeight = UITableViewAutomaticDimension;
    self.chatTableView.estimatedRowHeight = 50;
    
    [[DataManager sharedInstance] saveUserId:@"1" userName:@"System"];
    [[DataManager sharedInstance] saveUserId:@"1" userName:@"Nitesh"];
    
    
    
    
    
//
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

-(int)getRandomNumber{
    
    NSUInteger randomNumber = arc4random_uniform((int)tableData.count);
    
    NSLog(@"randomNumber => %lu",(unsigned long)randomNumber);
    
    return (int)randomNumber;
}

- (IBAction)postMessage:(id)sender {
    
    [[DataManager sharedInstance] saveMessage:self.messageTextView.text userID:@"2" completion:^(BOOL b, Message *msg) {
         NSLog(@"Data Saved in DB");
        [self performSelector:@selector(randomMessageFromSystem) withObject:self afterDelay:5.0 ];
    }];

    
}

-(void)randomMessageFromSystem{

    [[DataManager sharedInstance] saveMessage:[tableData objectAtIndex:[self getRandomNumber]] userID:@"1" completion:^(BOOL b, Message *msg) {
        NSLog(@"Data Saved in DB");
        
         [self performSelector:@selector(getMsg) withObject:self afterDelay:5.0 ];
        
    }];

}

-(void)getMsg{

    NSArray *allMessages =  [[DataManager sharedInstance] getAllMessages];
    
//    Message *msg = (Message *)[allMessages objectAtIndex:0];
    
    
    for (Message *msg in allMessages) {
        NSLog(@"msg ==> %@, msg.dateTime = %@",msg.messageDescription,msg.dateTime);
    }
    
//    NSLog(@"msg ==> %@",msg);
//    NSLog(@"msg ==> %@",msg.messageDescription);
}
@end
