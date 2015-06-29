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
        
        _eventTest = arrResult;
        
        for (PFObject *obj in arrResult) {
//            [_eventImg addObject:obj[@"image"]];
//            [_eventName addObject:obj[@"eventName"]];
//            [_eventContent addObject:obj[@"content"]];
//            [_eventDate addObject:obj[@"dateString"]];
            
            //Load pic
            NSLog(@"1");
            PFFile *imageData = obj[@"image"];
            NSLog(@"imagedata   %@", obj[@"image"]);
            [imageData getDataInBackgroundWithBlock:^(NSData *imgData, NSError *error) {
                            NSLog(@"2");
                if(error == nil){
                    //if i got the pic
                    NSLog(@"yes");
                    [_eventImg addObject:[UIImage imageWithData:imgData]];
                }
                else{
                                        NSLog(@"NO");
                    //if i don't
                    [_eventImg addObject:[UIImage imageNamed:@"ACLoginPic"]];
                }
                            NSLog(@"3");
            }];
        }
        NSLog(@"%@", _eventImg);
        [self.tableView reloadData];
         NSLog(@"eventName = %@",_eventName);

        
        
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
    
    
    UIImageView *eImgView = (UIImageView *)[cell viewWithTag:100];
    UILabel *eLable1 = (UILabel *)[cell viewWithTag:200];
    UILabel *eLable2 = (UILabel *)[cell viewWithTag:300];
    UITextField * eTextField = (UITextField *)[cell viewWithTag:400];
    
    eLable1.text = event[@"eventName"];
    eLable2.text = event[@"dateString"];
    eTextField.text = event[@"content"];

    eImgView.image = _eventImg[indexPath.row];

    
    
    return cell;
    
   
}


@end
