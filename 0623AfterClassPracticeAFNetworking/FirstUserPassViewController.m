//
//  FirstUserPassViewController.m
//  0623AfterClassPracticeAFNetworking
//
//  Created by lalaleelala on 6/24/15.
//  Copyright (c) 2015 lalaleelala. All rights reserved.
//

#import "FirstUserPassViewController.h"
#import <AFNetworking.h>
@interface FirstUserPassViewController ()
@property (strong,nonatomic) NSString *correctUser;
@property (strong,nonatomic) NSString *correctPass;
@property (strong,nonatomic) NSString *insertUser;
@property (strong,nonatomic) NSString *insertPass;
@property (strong,nonatomic) IBOutlet UITextField *usernameIn;
@property (strong,nonatomic) IBOutlet UITextField *passwordIn;
@end

@implementation FirstUserPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _insertUser = self.usernameIn.text;
    _insertPass = self.passwordIn.text;
    // Do any additional setup after loading the view.
    //
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)button2Present:(id)sender {
//    if ([self loadLoginInfo]) {
//        NSLog(@"OK2");
    [self loadLoginInfo];
//    }
//    else {
//        [self errorMessageLogin];
//    }
//    
//
//    
    
//    if (([_insertUser isEqualToString:_correctUser])&&([_insertPass isEqualToString:_correctPass] )) {
//        [self nextPresent];
//    }
//    else {
//        NSLog(@"HI");
//    }

}
-(void)errorMessageLogin{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Error"
                                  message:@"Incorrect Username || Password!!"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                                   }];
    

    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)nextPresent {
    NSLog(@"OK3");
    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"tabBarController"] animated:YES completion:nil];
}
- (BOOL) loadLoginInfo {
    
    NSDictionary *params = @{
                  @"email": self.usernameIn.text,
                  @"password":self.passwordIn.text,
                  @"api_key":@"bd2d81cca1c9951e7f7251b45792494f1fb24cf9",
                  @"auth_token":[[NSUserDefaults standardUserDefaults]valueForKey:@"auth_token"]
                  };
    
    static BOOL isLoginSuccess = NO;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:@"https://dojo.alphacamp.co/api/v1/login" parameters:params
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
//             NSLog(@"JSON: %@", responseObject);
             NSLog(@"OK");
             isLoginSuccess = YES;
             [self nextPresent];

         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
             isLoginSuccess = NO;
             [self errorMessageLogin];
         }];
    
    NSLog(@"isLoginSuccess      @%d", isLoginSuccess);
    return isLoginSuccess;
}


@end
