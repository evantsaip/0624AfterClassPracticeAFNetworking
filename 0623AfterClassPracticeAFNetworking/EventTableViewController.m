//
//  EventTableViewController.m
//  0623AfterClassPracticeAFNetworking
//
//  Created by lalaleelala on 6/29/15.
//  Copyright (c) 2015 lalaleelala. All rights reserved.
//

#import "EventTableViewController.h"

@interface EventTableViewController ()
@property (strong,nonatomic) NSArray *eventImg;
@property (strong,nonatomic) NSArray *eventTest;
@property (strong,nonatomic) NSArray *eventlab1;
@property (strong,nonatomic) NSArray *eventLab2;
@property (strong,nonatomic) NSArray *eventLabl3;
@property (strong,nonatomic) NSDictionary *eventPost;
@property (strong,nonatomic) NSString *eventDate;
@property (strong,nonatomic) NSString *eventName;
@property (strong,nonatomic) NSArray *eventContent;
//@property (strong,nonatomic) NSString
@end

@implementation EventTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Here is Event");
   [self getData];
////    _eventPost = @{@"eventImage":[UIImage imageNamed:@"Image0"],
//                   @"eventTitle":_eventLabl1,
//                   @"eventTime":_eventLabl2,
//                   @"eventTitle2":_eventLabl3,};
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}



-(void)getData {
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
//    [query getObjectInBackgroundWithId:@"lMQMOk8wjN" block:^(PFObject *eventName, NSError *error) {
//
//        NSLog(@"%@", eventName);
//    }];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *arrResult, NSError *error) {
        NSLog(@"%@", arrResult);
        for (PFObject *obj in arrResult) {
            // = obj[@"content"];
            //_eventLabl3 =
           // NSLog(@"%@", obj[@"content"]);
            _eventContent = obj[@"content"];
            _eventTest = arrResult;
        }
        
    }];
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
