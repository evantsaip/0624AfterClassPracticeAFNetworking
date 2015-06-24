//
//  ViewController.m
//  0623AfterClassPracticeAFNetworking
//
//  Created by lalaleelala on 6/24/15.
//  Copyright (c) 2015 lalaleelala. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    //Animation
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.center = self.view.center;
    [self.view addSubview:indicatorView];
    [indicatorView startAnimating];
    
    //
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"https://dojo.alphacamp.co/api/v1/login" parameters:@{@"email":@"evantsaip@gmail.com",@"password":@"SionAstal78",@"api_key":@"bd2d81cca1c9951e7f7251b45792494f1fb24cf9"}success:^(AFHTTPRequestOperation *operation, id responseObject) {
        ///
        [[NSUserDefaults standardUserDefaults]
         setValue:responseObject[@"auth_token"] forKey:@"auth_token"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        [self performSegueWithIdentifier:@"selfSegue" sender:self];
        
        ///
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [indicatorView stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
