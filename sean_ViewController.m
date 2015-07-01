//
//  sean_ViewController.m
//  
//
//  Created by lalaleelala on 6/30/15.
//
//

#import "sean_ViewController.h"

@interface sean_ViewController ()

@end

@implementation sean_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    PFQuery *query = [[PFQuery alloc]initWithClassName:@"Event"];
    [query whereKey:@"eventName" equalTo:@"Hello"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *arrResult, NSError *error) {
        for (PFObject *obj in arrResult) {
            PFFile *pfFile = obj[@"image"];
            [pfFile getDataInBackgroundWithBlock:^(NSData *imgData, NSError *error) {
                UIImage *img = [UIImage imageWithData:imgData];
                _imgView.image = img;
            }];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/






































@end
