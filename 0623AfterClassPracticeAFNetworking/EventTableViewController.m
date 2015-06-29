//
//  EventTableViewController.m
//  0623AfterClassPracticeAFNetworking
//
//  Created by lalaleelala on 6/29/15.
//  Copyright (c) 2015 lalaleelala. All rights reserved.
//

#import "EventTableViewController.h"

@interface EventTableViewController ()

@property (strong,nonatomic) NSArray *eventTest;
@property (strong,nonatomic) NSArray *eventlab1;
@property (strong,nonatomic) NSArray *eventLab2;
@property (strong,nonatomic) NSArray *eventLabl3;
@property (strong,nonatomic) NSDictionary *eventPost;
@property (strong,nonatomic) NSMutableArray *eventImg;
@property (strong,nonatomic) NSMutableArray *eventDate;
@property (strong,nonatomic) NSMutableArray *eventName;
@property (strong,nonatomic) NSMutableArray *eventContent;

@end

@implementation EventTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Here is Event");
   [self getData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)getData {
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    
    _eventContent = [[NSMutableArray alloc]init];
    _eventName = [[NSMutableArray alloc]init];
    _eventDate = [[NSMutableArray alloc]init];
    _eventImg = [[NSMutableArray alloc]init];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *arrResult, NSError *error) {
        //        NSLog(@"%@", arrResult);
        for (PFObject *obj in arrResult) {
            [_eventImg addObject:obj[@"image"]];
            [_eventName addObject:obj[@"eventName"]];
            [_eventContent addObject:obj[@"content"]];
            [_eventDate addObject:obj[@"dateString"]];
            _eventTest = arrResult;

        }
        [self.tableView reloadData];
         NSLog(@"eventName = %@",_eventName);
        
        // NSLog(@"%@",_eventContent);
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"count = %ld", _eventTest.count);
    return _eventTest.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];

    PFObject *event = _eventTest[indexPath.row];
    PFFile *imageData = event[@"image"];
    
    
    UIImageView *eImgView = (UIImageView *)[cell viewWithTag:100];
    UILabel *eLable1 = (UILabel *)[cell viewWithTag:200];
    UILabel *eLable2 = (UILabel *)[cell viewWithTag:300];
    UITextField * eTextField = (UITextField *)[cell viewWithTag:400];
    
    eLable1.text = event[@"eventName"];
    eLable2.text = event[@"dateString"];
    eTextField.text = event[@"content"];

    eImgView.image = nil;

    [imageData getDataInBackgroundWithBlock:^(NSData *imgData, NSError *error) {
        
        if(error == nil){
            //if i got the pic
            eImgView.image = [UIImage imageWithData:imgData];
            eImgView.backgroundColor = [UIColor clearColor];
        }
        else{
            //if i don't
            eImgView.image = nil;
            eImgView.backgroundColor = [UIColor grayColor];
        }
    }];
    
    return cell;
    
   
}


@end
