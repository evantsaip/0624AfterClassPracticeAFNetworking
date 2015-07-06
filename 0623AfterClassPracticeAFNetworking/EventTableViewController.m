//
//  EventTableViewController.m
//  0623AfterClassPracticeAFNetworking
//
//  Created by lalaleelala on 6/29/15.
//  Copyright (c) 2015 lalaleelala. All rights reserved.
//

#import "EventTableViewController.h"
#import "webViewController.h"

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
@property (strong,nonatomic) NSMutableArray *eventUrl;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) UIImage *justImg;
@end

@implementation EventTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Here is Event");
   [self getData];
    
    /////////////////////////////////////////////////////////
    
    
    PFObject *event= [PFObject objectWithClassName:@"Event"];
    event[@"content"] = @"Evan";
    event[@"eventDate"] = @"2015/07/1";
    event[@"eventName"] = @"Hello2";
    event[@"eventURL"] = @"https://github.com/evantsaip";
  
    //event[@"]
//    UIImage *img = [UIImage imageNamed:@"ssss"];
//    NSData *imageData = UIImagePNGRepresentation(img);
//    PFFile *imageFile = [PFFile fileWithName:@"ssss" data:imageData];
//    PFObject *userPhoto = [PFObject objectWithClassName:@"image"];
//    //userPhoto[@"imageName"] = @"My trip to Hawaii!";
//    //userPhoto[@"imageFile"] = imageFile;
//    [userPhoto saveInBackground];
    
    
    
    [event saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    ////////////////////////////////////////////////////////
    
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
    _eventUrl = [[NSMutableArray alloc]init];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *arrResult, NSError *error) {
        //        NSLog(@"%@", arrResult);
        for (PFObject *obj in arrResult) {
            [_eventImg addObject:obj[@"image"]];
            [_eventName addObject:obj[@"eventName"]];
            [_eventContent addObject:obj[@"content"]];
            [_eventDate addObject:obj[@"dateString"]];
            [_eventUrl addObject:obj [@"eventURL"]];
            _eventTest = arrResult;
        }
        [self.tableView reloadData];
        // NSLog(@"eventName = %@",_eventName);
        NSLog(@"eventURL = %@",_eventUrl);
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
    UITextField *eTextField = (UITextField *)[cell viewWithTag:400];
    UIButton *eButton = (UIButton *) [cell viewWithTag:500];
    eButton.tag = indexPath.row;
    [eButton addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    
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

- (void)push:(UIButton *)sender {
    self.url = _eventUrl[sender.tag];
    [self performSegueWithIdentifier:@"cellToNext" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    webViewController *destinationVC = segue.destinationViewController;
    destinationVC.url = self.url;
}



@end
