
//
//  CoursesTableViewController.m
//  0623AfterClassPracticeAFNetworking
//
//  Created by lalaleelala on 6/24/15.
//  Copyright (c) 2015 lalaleelala. All rights reserved.
//

#import "CoursesTableViewController.h"
#import <AFNetworking.h>
@interface CoursesTableViewController ()
@property(strong,nonatomic)NSArray *courses;
@property(strong,nonatomic)UIRefreshControl *refershControl;
@end

@implementation CoursesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _refershControl = [[UIRefreshControl alloc]init];
    [_refershControl addTarget:self action:@selector(loadCourses) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:_refershControl];
    [self loadCourses];

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
    return _courses.count;
}

-(void)loadCourses{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://dojo.alphacamp.co/api/v1/courses" parameters:
            @{@"api_key":@"bd2d81cca1c9951e7f7251b45792494f1fb24cf9",   @"auth_token":[[NSUserDefaults standardUserDefaults]valueForKey:@"auth_token"]}
     
     
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //////
             _courses = responseObject[@"courses"];
             [self.tableView reloadData];
        NSLog(@"JSON: %@", responseObject);
             NSLog(@"Success");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [_refershControl endRefreshing];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _courses[indexPath.row][@"name"];
    // Configure the cell...
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


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
