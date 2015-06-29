//
//  EventTableViewController.h
//  0623AfterClassPracticeAFNetworking
//
//  Created by lalaleelala on 6/29/15.
//  Copyright (c) 2015 lalaleelala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface EventTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIImageView *eventImage;
@property (weak, nonatomic) IBOutlet UILabel *eventLabl1;
@property (weak, nonatomic) IBOutlet UILabel *eventTime;
@property (weak, nonatomic) IBOutlet UILabel *eventLabl2;

@end
